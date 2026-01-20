#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from taro device
$(call inherit-product, device/qualcomm/taro/device.mk)

PRODUCT_DEVICE := taro
PRODUCT_NAME := twrp_taro
PRODUCT_BRAND := nubia
PRODUCT_MODEL := RedMagic 7S Pro
PRODUCT_MANUFACTURER := nubia

PRODUCT_GMS_CLIENTID_BASE := android-nubia

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="NX709S-user 12 SKQ1.220502.001 eng.nubia.20241204.170923 release-keys"

BUILD_FINGERPRINT := nubia/NX709S/NX709S:12/SKQ1.220502.001/eng.nubia.20241204.170923:user/release-keys
