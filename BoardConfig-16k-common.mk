#
# SPDX-FileCopyrightText: 2024 The Android Open-Source Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_BOOTS_16K),true)
# Configures the 16kb kernel directory.
TARGET_KERNEL_DIR := $(TARGET_KERNEL_DIR)/16kb

else ifeq ($(PRODUCT_16K_DEVELOPER_OPTION),true)
# Configures the 16kb kernel and modules for OTA updates.
TARGET_KERNEL_DIR_16K := $(TARGET_KERNEL_DIR)/16kb
BOARD_KERNEL_PATH_16K := $(TARGET_KERNEL_DIR_16K)/Image.lz4

BOARD_KERNEL_MODULES_16K += $(file < $(TARGET_KERNEL_DIR_16K)/vendor_kernel_boot.modules.load)
BOARD_KERNEL_MODULES_16K += $(file < $(TARGET_KERNEL_DIR_16K)/system_dlkm.modules.load)
BOARD_KERNEL_MODULES_16K += $(file < $(TARGET_KERNEL_DIR_16K)/vendor_dlkm.modules.load)
BOARD_KERNEL_MODULES_16K := $(foreach module,$(BOARD_KERNEL_MODULES_16K),$(TARGET_KERNEL_DIR_16K)/$(notdir $(module)))
BOARD_PREBUILT_DTBOIMAGE_16KB := $(TARGET_KERNEL_DIR_16K)/dtbo.img

# The 16kb mode does not use these modules.
BOARD_KERNEL_MODULES_16K := $(filter-out %/aoc_unit_test_dev.ko,$(BOARD_KERNEL_MODULES_16K))
BOARD_KERNEL_MODULES_16K := $(filter-out %/bcm_dbg.ko,$(BOARD_KERNEL_MODULES_16K))
BOARD_KERNEL_MODULES_16K := $(filter-out %/gnssif.ko,$(BOARD_KERNEL_MODULES_16K))
BOARD_KERNEL_MODULES_16K := $(filter-out %/gnss_spi.ko,$(BOARD_KERNEL_MODULES_16K))
BOARD_KERNEL_MODULES_16K := $(filter-out %/mali_kutf.ko,$(BOARD_KERNEL_MODULES_16K))
BOARD_KERNEL_MODULES_16K := $(filter-out %/mali_kutf_clk_rate_trace_test_portal.ko,$(BOARD_KERNEL_MODULES_16K))
BOARD_KERNEL_MODULES_16K := $(filter-out %/rt6160_regulator.ko,$(BOARD_KERNEL_MODULES_16K))
BOARD_KERNEL_MODULES_16K := $(filter-out %/sec_touch.ko,$(BOARD_KERNEL_MODULES_16K))
BOARD_KERNEL_MODULES_16K := $(filter-out %/sscoredump_sample_test.ko,$(BOARD_KERNEL_MODULES_16K))
BOARD_KERNEL_MODULES_16K := $(filter-out %/sscoredump_test.ko,$(BOARD_KERNEL_MODULES_16K))
BOARD_KERNEL_MODULES_16K := $(filter-out %/zram.ko,$(BOARD_KERNEL_MODULES_16K))
BOARD_KERNEL_MODULES_LOAD_16K := $(foreach module,$(BOARD_KERNEL_MODULES_16K),$(notdir $(module)))

BOARD_16K_OTA_USE_INCREMENTAL := true
BOARD_16K_OTA_MOVE_VENDOR := true
endif
