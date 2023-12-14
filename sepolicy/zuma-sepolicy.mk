# sepolicy that are shared among devices using zuma
BOARD_SEPOLICY_DIRS += device/google/zuma/sepolicy/vendor
BOARD_SEPOLICY_DIRS += device/google/zuma/sepolicy/radio
PRODUCT_PRIVATE_SEPOLICY_DIRS += device/google/zuma/sepolicy/radio/private

# unresolved SELinux error log with bug tracking
BOARD_SEPOLICY_DIRS += device/google/zuma/sepolicy/tracking_denials

PRODUCT_PUBLIC_SEPOLICY_DIRS += device/google/zuma/sepolicy/public
PRODUCT_PRIVATE_SEPOLICY_DIRS += device/google/zuma/sepolicy/private

# system_ext
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += device/google/zuma/sepolicy/system_ext/public
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += device/google/zuma/sepolicy/system_ext/private

# PowerStats HAL
BOARD_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/powerstats

# To be reviewed and removed.
BOARD_SEPOLICY_DIRS += device/google/zuma/sepolicy/legacy/whitechapel_pro
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += device/google/zuma/sepolicy/legacy/system_ext/public
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += device/google/zuma/sepolicy/legacy/system_ext/private

