# Android device tree for Redmi redmi note 13 5g (gold)

# Clone
    git clone https://github.com/naden01/xiaomi_gold.git -b staging device/xiaomi/gold

# Build
    export ALLOW_MISSING_DEPENDENCIES=true; . build/envsetup.sh; lunch twrp_gold-eng; mka vendorbootimage
