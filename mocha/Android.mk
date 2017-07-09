#
# Copyright (C) 2014 The Android Open Source Project
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
#

# Install the prebuilt webview apk.

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),mocha)

include $(CLEAR_VARS)

LOCAL_MODULE := WebView
LOCAL_MODULE_CLASS := APPS
LOCAL_MULTILIB := both
LOCAL_CERTIFICATE := $(DEFAULT_SYSTEM_DEV_CERTIFICATE)
LOCAL_REQUIRED_MODULES := \
        libwebviewchromium_loader \
        libwebviewchromium_plat_support

LOCAL_MODULE_TARGET_ARCH := arm arm64 mips x86 x86_64
my_src_arch := $(call get-prebuilt-src-arch,$(LOCAL_MODULE_TARGET_ARCH))
LOCAL_SRC_FILES := app/webview.apk

LOCAL_PREBUILT_JNI_LIBS_arm := @lib/armeabi-v7a/libwebviewchromium.so
LOCAL_PREBUILT_JNI_LIBS_arm64 := @lib/arm64-v8a/libwebviewchromium.so
LOCAL_PREBUILT_JNI_LIBS_mips := @lib/mips/libwebviewchromium.so
LOCAL_PREBUILT_JNI_LIBS_x86 := @lib/x86/libwebviewchromium.so
LOCAL_PREBUILT_JNI_LIBS_x86_64 := @lib/x86_64/libwebviewchromium.so
LOCAL_OVERRIDES_PACKAGES := webview

include $(BUILD_PREBUILT)

endif