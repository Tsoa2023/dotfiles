#!/usr/bin/env bash

set -o noclobber -o noglob -o nounset -o pipefail
IFS=$'\n'

FILE_PATH="${1}"         # Chemin complet du fichier
PV_WIDTH="${2:-80}"      # Largeur de preview
PV_HEIGHT="${3:-24}"     # Hauteur de preview
IMAGE_CACHE_PATH="${4}"  # Cache pour les images
PV_IMAGE_ENABLED="${5}"  # Images activées

FILE_EXTENSION="${FILE_PATH##*.}"
FILE_EXTENSION_LOWER="$(printf "%s" "${FILE_EXTENSION}" | tr '[:upper:]' '[:lower:]')"
MIME_TYPE="$(file --dereference --brief --mime-type -- "${FILE_PATH}" 2>/dev/null || echo "unknown")"

# Gestion des extensions spécifiques
handle_extension() {
    case "${FILE_EXTENSION_LOWER}" in
        # Archives
        7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
            if command -v 7z >/dev/null 2>&1; then
                7z l "${FILE_PATH}" 2>/dev/null && exit 0
            elif command -v unzip >/dev/null 2>&1 && [[ "${FILE_EXTENSION_LOWER}" == "zip" ]]; then
                unzip -l "${FILE_PATH}" 2>/dev/null && exit 0
            elif command -v tar >/dev/null 2>&1; then
                tar -tf "${FILE_PATH}" 2>/dev/null && exit 0
            fi
            exit 1;;
            
        # Documents PDF
        pdf)
            if command -v pdftotext >/dev/null 2>&1; then
                pdftotext -l 10 -nopgbrk -q -- "${FILE_PATH}" - 2>/dev/null && exit 0
            elif command -v mutool >/dev/null 2>&1; then
                mutool draw -F txt -i -- "${FILE_PATH}" 1-10 2>/dev/null && exit 0
            elif command -v pdfinfo >/dev/null 2>&1; then
                pdfinfo "${FILE_PATH}" 2>/dev/null && exit 0
            fi
            exit 1;;
            
        # Fichiers Office
        docx|doc|odt)
            if command -v pandoc >/dev/null 2>&1; then
                pandoc "${FILE_PATH}" -t plain 2>/dev/null && exit 0
            elif command -v odt2txt >/dev/null 2>&1; then
                odt2txt "${FILE_PATH}" 2>/dev/null && exit 0
            fi
            exit 1;;
            
        # Médias vidéo/audio
        mp4|mkv|avi|mov|wmv|flv|webm|m4v|mp3|flac|wav|ogg|m4a)
            if command -v mediainfo >/dev/null 2>&1; then
                mediainfo "${FILE_PATH}" 2>/dev/null && exit 0
            elif command -v ffprobe >/dev/null 2>&1; then
                ffprobe -hide_banner -pretty "${FILE_PATH}" 2>&1 && exit 0
            fi
            exit 1;;
            
        # Images (avec preview optimal)
        jpg|jpeg|png|gif|bmp|tiff|tif|webp|svg|ico)
            # Essayer chafa d'abord (meilleure qualité terminal)
            if command -v chafa >/dev/null 2>&1; then
                chafa --fill=block --symbols=block -c full -s "${PV_WIDTH}x$((PV_HEIGHT-2))" \
                      --animate=off --polite=on "${FILE_PATH}" 2>/dev/null && exit 0
            fi
            # Fallback vers autres outils
            if command -v img2txt >/dev/null 2>&1; then
                img2txt --gamma=0.6 --width="${PV_WIDTH}" "${FILE_PATH}" 2>/dev/null && exit 0
            elif command -v catimg >/dev/null 2>&1; then
                catimg -w "${PV_WIDTH}" "${FILE_PATH}" 2>/dev/null && exit 0
            fi
            exit 1;;
    esac
}

# Gestion par type MIME
handle_mime() {
    case "${MIME_TYPE}" in
        # Texte et code source
        text/* | */xml | application/json | application/x-ndjson | application/javascript)
            if command -v bat >/dev/null 2>&1; then
                bat --style=numbers,changes --color=always --wrap=never \
                    --terminal-width="${PV_WIDTH}" --pager=never \
                    "${FILE_PATH}" 2>/dev/null && exit 0
            elif command -v highlight >/dev/null 2>&1; then
                highlight -O ansi --force "${FILE_PATH}" 2>/dev/null && exit 0
            elif command -v pygmentize >/dev/null 2>&1; then
                pygmentize -f terminal "${FILE_PATH}" 2>/dev/null && exit 0
            else
                head -n $((PV_HEIGHT-5)) "${FILE_PATH}" 2>/dev/null && exit 0
            fi
            exit 1;;
            
        # Images
        image/*)
            handle_extension
            exit 1;;
            
        # Vidéo/Audio
        video/* | audio/*)
            handle_extension
            exit 1;;
            
        # Binaires
        application/x-executable | application/x-pie-executable)
            if command -v file >/dev/null 2>&1; then
                file -b "${FILE_PATH}" && echo "" && exit 0
            fi
            if command -v ldd >/dev/null 2>&1; then
                echo "Dépendances partagées:" && ldd "${FILE_PATH}" 2>/dev/null && exit 0
            fi
            exit 1;;
    esac
}

# Fallback par défaut
handle_fallback() {
    # Informations basiques du fichier
    if command -v file >/dev/null 2>&1; then
        file --dereference --brief -- "${FILE_PATH}" 2>/dev/null && exit 0
    fi
    
    # Stats du fichier
    if command -v stat >/dev/null 2>&1; then
        stat "${FILE_PATH}" 2>/dev/null && exit 0
    fi
    
    # Taille et type basique
    ls -la "${FILE_PATH}" 2>/dev/null && exit 0
    exit 1
}

# Execution principale
handle_extension
handle_mime  
handle_fallback
