# Inherit common VIPER stuff
$(call inherit-product, vendor/viper/config/common_full.mk)

PRODUCT_PACKAGES += AppDrawer

DEVICE_PACKAGE_OVERLAYS += vendor/cm/overlay/tv
