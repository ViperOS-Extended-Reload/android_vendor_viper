#!/bin/bash

PRODUCT_OUT="$1"
WIDTH="$2"
HEIGHT="$3"
HALF_RES="$4"

OUT="$PRODUCT_OUT/obj/BOOTANIMATION"

if [ "$HEIGHT" -lt "$WIDTH" ]; then
    IMAGEWIDTH="$HEIGHT"
else
    IMAGEWIDTH="$WIDTH"
fi

IMAGESCALEWIDTH="$IMAGEWIDTH"
IMAGESCALEHEIGHT=$(expr $IMAGESCALEWIDTH / 3)

if [ "$HALF_RES" = "true" ]; then
    IMAGEWIDTH=$(expr $IMAGEWIDTH / 2)
fi

IMAGEHEIGHT=$(expr $IMAGEWIDTH / 3)

RESOLUTION=""$IMAGEWIDTH"x"$IMAGEHEIGHT""

for part_cnt in 1 2
do
    mkdir -p "$OUT/bootanimation/part$part_cnt"
done
tar xfp "vendor/viper/bootanimation/bootanimation.tar" -C "$OUT/bootanimation/"
mogrify -resize $RESOLUTION -colors 250 "$OUT/bootanimation/"*"/"*".jpg"

# Create desc.txt
echo "$IMAGESCALEWIDTH $IMAGESCALEHEIGHT" 60 > "$OUT/bootanimation/desc.txt"
cat "vendor/viper/bootanimation/desc.txt" >> "$OUT/bootanimation/desc.txt"

# Create bootanimation.zip
cd "$OUT/bootanimation"

zip -qr0 "$OUT/bootanimation.zip" .
