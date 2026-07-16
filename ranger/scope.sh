#!/usr/bin/env bash
# ==============================================
# SCRIPT DE PRÉVISUALISATION AVANCÉ
# ==============================================

set -o noclobber -o noglob -o nounset -o pipefail
IFS=$'\n'

FILE_PATH="$1"
PV_WIDTH="$2"
PV_HEIGHT="$3"
IMAGE_CACHE_PATH="$4"
PV_IMAGE_ENABLED="$5"

FILE_EXTENSION="${FILE_PATH##*.}"
FILE_EXTENSION_LOWER="${FILE_EXTENSION,,}"
MIME_TYPE=$(file --dereference --brief --mime-type -- "${FILE_PATH}")

handle_extension() {
    case "${FILE_EXTENSION_LOWER}" in
        # Archives
        a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|\
        rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
            atool --list -- "${FILE_PATH}" && exit 5
            bsdtar --list --file "${FILE_PATH}" && exit 5
            exit 1;;
        rar)
            unrar lt -p- -- "${FILE_PATH}" && exit 5
            exit 1;;
        7z)
            7z l -p -- "${FILE_PATH}" && exit 5
            exit 1;;

        # PDF
        pdf)
            pdftotext -l 10 -nopgbrk -q -- "${FILE_PATH}" - | \
              fmt -w "${PV_WIDTH}" && exit 5
            mutool draw -F txt -i -- "${FILE_PATH}" 1-10 | \
              fmt -w "${PV_WIDTH}" && exit 5
            exiftool "${FILE_PATH}" && exit 5
            exit 1;;

        # BitTorrent
        torrent)
            transmission-show -- "${FILE_PATH}" && exit 5
            exit 1;;

        # OpenDocument
        odt|ods|odp|sxw)
            odt2txt "${FILE_PATH}" && exit 5
            pandoc -s -t markdown -- "${FILE_PATH}" && exit 5
            exit 1;;

        # Microsoft Office
        xlsx)
            xlsx2csv -- "${FILE_PATH}" && exit 5
            exit 1;;

        # HTML
        htm|html|xhtml)
            w3m -dump "${FILE_PATH}" && exit 5
            lynx -dump -- "${FILE_PATH}" && exit 5
            elinks -dump "${FILE_PATH}" && exit 5
            pandoc -s -t markdown -- "${FILE_PATH}" && exit 5
            ;;

        # JSON
        json)
            jq --color-output . "${FILE_PATH}" && exit 5
            python3 -m json.tool -- "${FILE_PATH}" && exit 5
            ;;
    esac
}

handle_image() {
    local mimetype="${1}"
    case "${mimetype}" in
        image/svg+xml|image/svg)
            convert -- "${FILE_PATH}" "${IMAGE_CACHE_PATH}" && exit 6
            exit 1;;
        image/*)
            local orientation
            orientation="$( identify -format '%[EXIF:Orientation]\n' -- "${FILE_PATH}" )"
            if [[ -n "$orientation" && "$orientation" != 1 ]]; then
                convert -- "${FILE_PATH}" -auto-orient "${IMAGE_CACHE_PATH}" && exit 6
            fi

            exit 7;;
        video/*)
            ffmpegthumbnailer -i "${FILE_PATH}" -o "${IMAGE_CACHE_PATH}" -s 0 && exit 6
            exit 1;;
        application/pdf)
            pdftoppm -f 1 -l 1 \
                     -scale-to-x 1920 \
                     -scale-to-y -1 \
                     -singlefile \
                     -jpeg -tiffcompression jpeg \
                     -- "${FILE_PATH}" "${IMAGE_CACHE_PATH%.*}" \
                && exit 6 || exit 1;;
        application/epub*)
            epub-thumbnailer "${FILE_PATH}" "${IMAGE_CACHE_PATH}" 1024 && exit 6
            exit 1;;
        application/font*|application/*opentype)
            preview_png="/tmp/$(basename "${IMAGE_CACHE_PATH%.*}").png"
            if fontimage -o "${preview_png}" \
                         --pixelsize "120" \
                         --fontname \
                         --pixelsize "80" \
                         --text "  ABCDEFGHIJKLMNOPQRSTUVWXYZ  " \
                         --text "  abcdefghijklmnopqrstuvwxyz  " \
                         --text "  0123456789.:,;(*!?') ff fl fi ffi ffl  " \
                         --text "  The quick brown fox jumps over the lazy dog.  " \
                         "${FILE_PATH}";
            then
                convert -- "${preview_png}" "${IMAGE_CACHE_PATH}" \
                    && rm "${preview_png}" \
                    && exit 6
            else
                exit 1
            fi
            ;;
    esac
}

handle_mime() {
    local mimetype="${1}"
    case "${mimetype}" in
        text/* | */xml)
            if [[ "${MIME_TYPE}" =~ charset=binary ]]; then
                exit 1
            fi
            if command -v bat > /dev/null 2>&1; then
                bat --color=always --style=plain \
                    --line-range :"${PV_HEIGHT}" -- "${FILE_PATH}" && exit 5
            elif command -v highlight > /dev/null 2>&1; then
                highlight --replace-tabs="${HIGHLIGHT_TABWIDTH:-8}" \
                          --out-format=ansi \
                          --style="${HIGHLIGHT_STYLE:-pablo}" \
                          --force -- "${FILE_PATH}" && exit 5
            fi
            head -n "${PV_HEIGHT}" -- "${FILE_PATH}" && exit 5
            exit 1;;

        image/*)
            img2txt --gamma=0.6 --width="${PV_WIDTH}" -- "${FILE_PATH}" && exit 4
            exiftool "${FILE_PATH}" && exit 5
            exit 1;;

        video/* | audio/*)
            mediainfo "${FILE_PATH}" && exit 5
            exiftool "${FILE_PATH}" && exit 5
            exit 1;;
    esac
}

handle_fallback() {
    echo '----- File Type Classification -----'
    file --dereference --brief -- "${FILE_PATH}" && exit 5
    exit 1
}

MIMETYPE="$( file --dereference --brief --mime-type -- "${FILE_PATH}" )"
if [[ "${PV_IMAGE_ENABLED}" == 'True' ]]; then
    handle_image "${MIMETYPE}"
fi
handle_extension
handle_mime "${MIMETYPE}"
handle_fallback

exit 1
