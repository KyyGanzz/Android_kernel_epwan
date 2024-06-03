#!/bin/bash

# Copy Image/dtbo/dtb to AnyKernel3
KERNEL_DIR="$PWD"
KERNEL_NSE="$KERNEL_DIR/out/outputs/Beryllium/OLD-DRIVER-NSE/Image.gz-dtb"
KERNEL_SE="$KERNEL_DIR/out/outputs/Beryllium/NEW-DRIVER-SE/Image.gz-dtb"
AK3_DIR="$KERNEL_DIR/AK3"
PHONE="Beryllium"

        echo "* Copy Image.gz-dtb to AnyKernel3 directory"
	    if [ -f "$KERNEL_NSE","$KERNEL_SE" ]; then
            cp -r "$KERNEL_NSE" "$AK3_DIR"/kernel/NSE
        else
	    cp -r "$KERNEL_SE" "$AK3_DIR"/kernel/SE
        fi

        echo "* Complete!"
        echo ""

# Compress to ZIP
echo ""
echo "* Create ZIP"
cd "$AK3_DIR" || exit
ZIP_NAME=Kurumi_"$PHONE"_"$(date +'%d%m%Y')"_"$(date +'%H%M')".zip
zip -r9 "$ZIP_NAME" ./*

