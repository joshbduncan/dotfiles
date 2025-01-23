#!/usr/bin/env bash

# ~~~~~~~~~~ Image Manipulation Functions ~~~~~~~~~~

# Get the width x height of an image file
# arg1: image file
function img-size() {
    for file in "$@"; do
        # shellcheck disable=SC2155
        local width=$(identify -format "%w" "$file") >/dev/null
        # shellcheck disable=SC2155
        local height=$(identify -format "%h" "$file") >/dev/null

        echo -e "Size of $file: $width*$height"
    done
}

# Resize an image
# arg1: image file
# arg2: resize width
# arg3: modify in place (default: false)
# Example: imgresize cool_image.jpg 1200 true
function img-resize() {
    local filename=${1%\.*}
    local extension="${1##*.}"
    local separator="_"
    if [ -n "$3" ]; then
        local finalName="$filename.$extension"
    else
        local finalName="$filename$separator$2.$extension"
    fi
    magick "$1" -quality 100 -resize "$2" "$finalName"
    echo "$finalName resized to $2"
}

# Resize all images
# arg1: extension of images to resize
# arg2: resize width
# arg3: modify in place (default: false)
# Example: imgresizeall jpg 1000 true
function img-resize-all() {
    for f in *."${1}"; do
        if [ -n "$3" ]; then
            imgresize "$f" "${2}" t
        else
            imgresize "$f" "${2}"
        fi
    done
}

# Convert image(s) to jpg
# args: image file(s) to convert
function img-2-jpg() {
    for file in "$@"; do
        local filename=${file%\.*}
        magick -quality 100 "$file" "${filename}.jpg"
    done
}

# Convert image(s) to png
# args: image file(s) to convert
function img-2-png() {
    for file in "$@"; do
        local filename=${file%\.*}
        magick -quality 100 "$file" "${filename}.png"
    done
}

# Convert image(s) to webp
# args: image file(s) to convert
function img-2-webp() {
    for file in "$@"; do
        local filename=${file%\.*}
        cwebp -q 100 "$file" -o "$(basename "${filename}").webp"
    done
}
