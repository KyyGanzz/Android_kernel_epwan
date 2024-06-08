#!/bin/bash

# Copy Image/dtbo/dtb to AnyKernel3
KERNEL_DIR="$PWD"
KERNEL_NSE="$KERNEL_DIR/out/outputs/Beryllium/OLD-DRIVER-NSE/Image.gz-dtb"
KERNEL_SE="$KERNEL_DIR/out/outputs/Beryllium/OLD-DRIVER-SE/Image.gz-dtb"
AK3_DIR="$KERNEL_DIR/AK3"
DRIVERS="Old_Drivers"
PHONE="Beryllium"

        echo "* Copy Image.gz-dtb to AnyKernel3 directory"
	echo "############################################"
	sleep 0.7
	echo -e " Copy To NSE Directory "
            cp -r "$KERNEL_NSE" "$AK3_DIR"/kernel/NSE
	echo "###############################"
	sleep 0.7
	echo -e  " Copy To SE Directory "
	    cp -r "$KERNEL_SE" "$AK3_DIR"/kernel/SE
	echo "###############################"
	sleep 0.7

	echo "####################"
        echo "#### Complete!  ####"
        echo "####################"
	echo ""


# Compress to ZIP
echo ""
echo "####################"
echo "#### Create ZIP ####"
echo "####################"
echo ""
cd "$AK3_DIR" || exit
ZIP_NAME=Kurumi_"$PHONE"_"$DRIVERS"_"(date +'%d%m%Y')"_"$(date +'%H%M')".zip
zip -r9 "$ZIP_NAME" ./*

# Upload
echo -e ""
echo -e "####################"
echo -e " It's Time To Brick "
echo -e "####################"
echo -e ""
sleep 0.5
curl --progress-bar -T "$ZIP_NAME" https://pixeldrain.com/api/file/ | cat || exit
