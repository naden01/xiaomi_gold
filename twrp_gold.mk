#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from gold device
$(call inherit-product, device/xiaomi/gold/device.mk)

PRODUCT_DEVICE := gold
PRODUCT_NAME := twrp_gold
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := gold
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="vnd_gold-user 12 UP1A.231005.007 V816.0.8.0.UNQMIXM release-keys"

BUILD_FINGERPRINT := Redmi/vnd_gold/gold:12/UP1A.231005.007/V816.0.8.0.UNQMIXM:user/release-keys