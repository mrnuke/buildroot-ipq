#!/bin/sh

# This script creates u-boot FIT image containing the kernel and the DT.

MKIMAGE=$HOST_DIR/bin/mkimage

# Generate the FIT image
$MKIMAGE -f auto \
        -A arm64 \
        -a 0x42000000 \
        -d "$BINARIES_DIR/Image.gz" \
        -b "$BINARIES_DIR/ipq9554-be550-lnx.dtb" \
        "$BINARIES_DIR/uImage.itb"
