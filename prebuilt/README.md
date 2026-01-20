# Prebuilt Files for RedMagic 7S Pro (NX709S)

## Required Files

You need to extract the following files from your device's stock boot/recovery images and place them in this directory:

### 1. Kernel Binary
- **File**: `kernel`
- **Location**: Place in `prebuilt/kernel`
- **How to extract**:
  ```bash
  # Extract from boot.img using Android Image Kitchen or similar tool
  # The kernel is usually named "Image" or "Image.gz"
  ```

### 2. Device Tree Blob (DTB)
- **File**: `dtb` or multiple `.dtb` files
- **Location**: Place in `prebuilt/dtb/`
- **How to extract**:
  ```bash
  # Extract from boot.img - DTB is usually appended to kernel or separate
  # If multiple DTBs exist, place all in the dtb/ folder
  ```

### 3. Device Tree Blob Overlay (DTBO)
- **File**: `dtbo.img`
- **Location**: Place in `prebuilt/dtbo.img`
- **How to extract**:
  ```bash
  # Extract from the dtbo partition
  adb pull /dev/block/bootdevice/by-name/dtbo dtbo.img
  # OR from your stock ROM's dtbo partition
  ```

### 4. Vendor Boot Image (Optional but Recommended)
- **File**: `vendor_boot.img`
- **Location**: Place in `prebuilt/vendor_boot.img`
- **How to extract**:
  ```bash
  # Extract from the vendor_boot partition
  adb pull /dev/block/bootdevice/by-name/vendor_boot vendor_boot.img
  ```

## Extraction Instructions

### Method 1: From Device (Requires Root)
```bash
adb shell su -c "dd if=/dev/block/bootdevice/by-name/boot of=/sdcard/boot.img"
adb shell su -c "dd if=/dev/block/bootdevice/by-name/dtbo of=/sdcard/dtbo.img"
adb shell su -c "dd if=/dev/block/bootdevice/by-name/vendor_boot of=/sdcard/vendor_boot.img"
adb pull /sdcard/boot.img
adb pull /sdcard/dtbo.img
adb pull /sdcard/vendor_boot.img
```

Then use [Android Image Kitchen](https://github.com/osm0sis/Android-Image-Kitchen) to unpack boot.img:
```bash
./unpackimg.sh boot.img
# Kernel will be in split_img/ folder
# DTB may be in split_img/ or ramdisk/
```

### Method 2: From Stock ROM
1. Download the official stock ROM for NX709S
2. Extract the ROM package
3. Locate `boot.img`, `dtbo.img`, and `vendor_boot.img`
4. Use Android Image Kitchen to extract kernel and DTB from boot.img

## File Structure After Extraction

```
prebuilt/
├── README.md (this file)
├── kernel (extracted from boot.img)
├── dtb (extracted DTB file or symlink to dtb/xxxx.dtb)
├── dtb/
│   └── (optional: individual .dtb files if multiple exist)
├── dtbo.img (extracted from dtbo partition)
└── vendor_boot.img (optional: extracted from vendor_boot partition)
```

## Notes

- The `kernel` file should be the raw Image binary (uncompressed)
- If your boot.img contains a compressed kernel (Image.gz), decompress it first
- For Snapdragon 8+ Gen 1 (taro), boot header version 4 is used
- Virtual A/B devices (like this one) require vendor_boot.img for proper TWRP functionality
