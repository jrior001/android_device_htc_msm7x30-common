# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# SELinux
-include device/qcom/sepolicy/sepolicy.mk

BOARD_HARDWARE_CLASS := device/htc/msm7x30-common/cmhw

TARGET_SPECIFIC_HEADER_PATH := device/htc/msm7x30-common/include

# General
TARGET_BOARD_PLATFORM := msm7x30
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := scorpion
TARGET_CPU_SMP := false
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
BOARD_USES_QCOM_HARDWARE := true

# No bootloader image with ROM
TARGET_NO_BOOTLOADER := true

# Build EXT4 and F2FS tools
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Audio
BOARD_HAVE_HTC_AUDIO := true
BOARD_HAVE_PRE_KITKAT_AUDIO_POLICY_BLOB := true # Check later
BOARD_USES_LEGACY_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := false
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := false
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := false

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Boot Animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true

# Display
BOARD_EGL_CFG := device/htc/msm7x30-common/rootdir/system/lib/egl/egl.cfg
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_USES_ION := true
BOARD_USES_PMEM_ADSP := true
TARGET_USES_C2D_COMPOSITION := true
USE_OPENGL_RENDERER := true

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7x30
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 1240
TARGET_GPS_HAL_PATH := device/htc/msm7x30-common/gps

# Media
USE_DEVICE_SPECIFIC_CAMERA := true
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB -DNO_UPDATE_PREVIEW
TARGET_RELEASE_CPPFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Misc
BOARD_NEEDS_MEMORYHEAPPMEM := true
TARGET_PROVIDES_LIBLIGHT := true
EXTENDED_FONT_FOOTPRINT := true
BLOCK_BASED_OTA := false
TARGET_NEEDS_NON_PIE_SUPPORT := true
BOARD_PROVIDES_LIBRIL := true

# Use dlmalloc instead of jemalloc because it's
# supposedly better in single-threaded applications
# http://blog.poweredbytoast.com/memory-allocators
MALLOC_IMPL := dlmalloc

# Wifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_STA := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"

# rmt_storage
BOARD_USES_LEGACY_MMAP := true

# Recovery
TARGET_RECOVERY_DEVICE_DIRS += device/htc/msm7x30-common
# SELinux
#BOARD_SEPOLICY_DIRS += \
#    device/htc/msm7x30-common/sepolicy

#BOARD_SEPOLICY_UNION += \
#    app.te \
#    bluetooth.te \
#    device.te \
#    domain.te \
#    drmserver.te \
#    file_contexts \
#    file.te \
#    hci_init.te \
#    healthd.te \
#    init.te \
#    init_shell.te \
#    keystore.te \
#    kickstart.te \
#    mediaserver.te \
#    rild.te \
#    surfaceflinger.te \
#    system_server.te \
#    ueventd.te \
#    untrusted_app.te \
#    vold.te \
#    wpa.te

# Dexpreopt
ifeq ($(USE_DEXPREOPT),true)
    # Enable dex-preoptimization to speed up first boot sequence
    ifeq ($(HOST_OS),linux)
        ifeq ($(WITH_DEXPREOPT),)
            WITH_DEXPREOPT := true
        endif
    endif
endif
