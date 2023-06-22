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

    export KBUILD_BUILD_USER="Neko_Turu"
    export KBUILD_BUILD_HOST="Weeaboo"
    
    export ARCH=arm64
    export CC=clang
    export SUBARCH=arm64
    export PATH="/workspace/ehhe/weebx-clang/bin:$PATH"
    export STRIP="/workspace/ehhe/weebx-clang/aarch64-linux-gnu/bin/strip"
    
    make -j$(nproc --all) O=out ARCH=arm64 beryllium_defconfig
    make -j$(nproc --all) O=out \
                          ARCH=arm64 \
                          AR=llvm-ar \
                          NM=llvm-nm \
                          OBJCOPY=llvm-objcopy \
                          OBJDUMP=llvm-objdump \
                          STRIP=llvm-strip \
                          CC=clang \
                          LD=ld.lld \
                          CROSS_COMPILE=/workspace/ehhe/weebx-clang/bin/aarch64-linux-gnu- \
                          CROSS_COMPILE_ARM32=/workspace/ehhe/weebx-clang/bin/arm-linux-gnueabi- \
    
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
