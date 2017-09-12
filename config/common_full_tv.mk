# Inherit common VIPER stuff
$(call inherit-product, vendor/viper/config/common_full.mk)

PRODUCT_PACKAGES += TvSettings

DEVICE_PACKAGE_OVERLAYS += vendor/cm/overlay/tv
