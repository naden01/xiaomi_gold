#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/gold

# For building with minimal manifest
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_PREBUILT_ELF_FILES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
SOONG_ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_USES_64_BIT_BINDER := true

# Power
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Assertation
TARGET_OTA_ASSERT_DEVICE := gold

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6833
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Display
#TARGET_SCREEN_DENSITY := 480

# Kernel
TARGET_KERNEL_ARCH := arm64
BOARD_RAMDISK_USE_LZ4 := true
TARGET_KERNEL_HEADER_ARCH := arm64

TARGET_NO_KERNEL := true
BOARD_KERNEL_SEPARATED_DTBO := true

TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img

BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_VENDOR_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_PAGE_SIZE := 4096
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_TAGS_OFFSET := 0x07c08000
BOARD_HEADER_SIZE := 2128
BOARD_DTB_SIZE := 190569
BOARD_DTB_OFFSET := 0x07c08000

#args
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --vendor_cmdline $(BOARD_VENDOR_CMDLINE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_PAGE_SIZE) --board ""
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864

BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_PARTITION_LIST := odm odm_dlkm product system system_ext vendor vendor_dlkm
BOARD_MAIN_SIZE := 9122611200 # TODO: Fix hardcoded value

BOARD_PARTITION_LIST := $(call to-upper, $(BOARD_MAIN_PARTITION_LIST))
$(foreach p, $(BOARD_PARTITION_LIST), $(eval BOARD_$(p)IMAGE_FILE_SYSTEM_TYPE := erofs))
$(foreach p, $(BOARD_PARTITION_LIST), $(eval TARGET_COPY_OUT_$(p) := $(call to-lower, $(p))))

# File System
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODM_DLKIMAGE_FILE_SYSTEM_TYPE := ext4

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm
TARGET_COPY_OUT_ODM_DLKM := odm_dlkm

# Fstab
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Treble
BOARD_VNDK_VERSION := current

# Hardware
BOARD_USES_MTK_HARDWARE := true

# Platform
TARGET_BOARD_PLATFORM := mt6833

# Resolution
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# System as root
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_USE_FSCRYPT_POLICY := 2
TW_FORCE_KEYMASTER_VER := true

# Recovery
TARGET_NO_RECOVERY := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_USES_VENDOR_DLKMIMAGE := true
BOARD_USES_ODM_DLKIMAGE := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

# Vendor_boot recovery ramdisk
BOARD_USES_RECOVERY_AS_BOOT := 
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := 
TW_LOAD_VENDOR_BOOT_MODULES := true
TW_LOAD_VENDOR_MODULES := "ft3683g.ko gt9916r.ko"

# Verified Boot
BOARD_AVB_ENABLE := true

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Fastbootd
TW_INCLUDE_FASTBOOTD := true

# brightness
TW_FRAMERATE := 60
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_DEFAULT_BRIGHTNESS := 1000
TW_MAX_BRIGHTNESS := 4000

# Debug
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

# TWRP Configuration
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_LPDUMP := true
TW_INCLUDE_LPTOOLS := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_APEX := true
TW_INCLUDE_NTFS_3G := true
TARGET_USES_MKE2FS := true
TW_INCLUDE_FUSE_EXFAT := true
TW_EXTRA_LANGUAGES := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_DEVICE_VERSION := Redmi Note 13 5g | Nazephyrus
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file
TW_BATTERY_SYSFS_WAIT_SECONDS := 6
TW_BACKUP_EXCLUSIONS := /data/fonts
TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true
