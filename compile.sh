#!/bin/bash
#Edit by Neko

# init
function init() {
    echo "==========================="
    echo "= START COMPILING KERNEL  ="
    echo "==========================="
}
# Main 
function compile() {

curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash -

    export KBUILD_BUILD_USER="Neko_Turu"
    export KBUILD_BUILD_HOST="Weeaboo"
    
    export ARCH=arm64
    export SUBARCH=arm64
    export PATH="/workspace/ehhe/proton-clang/bin:${PATH}"
    export LD_LIBRARY_PATH="/workspace/ehhe/proton-clang/lib:$LD_LIBRARY_PATH"

    make -j$(nproc --all) O=out ARCH=arm64 beryllium_defconfig
    make -j$(nproc --all) O=out \
                        ARCH=arm64 \
                        CC=clang \
                        LD=ld.lld \
                        CROSS_COMPILE=aarch64-linux-gnu- \
                        CROSS_COMPILE_ARM32=arm-linux-gnueabi-
    
}
#end
function end(){
    echo "==========================="
    echo "=  COMPILE KERNEL COMPLETE    ="
    echo "=    Santai Dulu Ngga Sih    ="
    echo "==========================="
}

# execute
init
compile
end
