#!/usr/bin/env bash
set -o noclobber -o noglob -o nounset -o pipefail
IFS=$'\n'

FILE_PATH="${1}"
PV_WIDTH="${2:-80}"
PV_HEIGHT="${3:-24}"
IMAGE_CACHE_PATH="${4}"
PV_IMAGE_ENABLED="${5:-True}"

FILE_EXTENSION="${FILE_PATH##*.}"
FILE_EXTENSION_LOWER="$(printf "%s" "${FILE_EXTENSION}" | tr '[:upper:]' '[:lower:]')"
MIME_TYPE="$(file --dereference --brief --mime-type -- "${FILE_PATH}")"

handle_extension() {
    case "${FILE_EXTENSION_LOWER}" in
        7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
            7z l "${FILE_PATH}" && exit 0
            exit 1;;
        pdf)
            pdftotext -l 10 -nopgbrk -q -- "${FILE_PATH}" - && exit 0
            mutool draw -F txt -i -- "${FILE_PATH}" 1-10 && exit 0
            exit 1;;
        mp4|mkv|avi|mov|wmv|flv|webm|m4v)
            mediainfo "${FILE_PATH}" && exit 0
            exit 1;;
        jpg|jpeg|png|gif|bmp|tiff|webp)
            chafa --fill=block --symbols=block -c 256 -s "${PV_WIDTH}x${PV_HEIGHT}" "${FILE_PATH}" && exit 0
            exit 1;;
    esac
}

handle_mime() {
    case "${MIME_TYPE}" in
        text/* | */xml | application/json | application/x-ndjson)
            bat --style=numbers,changes --wrap never --terminal-width "${PV_WIDTH}" -- "${FILE_PATH}" && exit 0
            cat "${FILE_PATH}" && exit 0
            exit 1;;
        image/*)
            chafa --fill=block --symbols=block -c 256 -s "${PV_WIDTH}x${PV_HEIGHT}" "${FILE_PATH}" && exit 0
            exit 1;;
        video/* | audio/*)
            mediainfo "${FILE_PATH}" && exit 0
            exit 1;;
    esac
}

handle_fallback() {
    file --dereference --brief -- "${FILE_PATH}" && exit 0
    exit 1
}

handle_extension
handle_mime
handle_fallback
