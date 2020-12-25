ARCHS = arm64
TARGET = appletv:clang
FINALPACKAGE = 1
GO_EASY_ON_ME = 1

SYSROOT = $(THEOS)/sdks/AppleTVOS12.4.sdk
THEOS_DEVICE_IP = 192.168.x.xxx
INSTALL_TARGET_PROCESSES = TVSystemMenuService 

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = TakeMeToNito
$(BUNDLE_NAME)_FILES =  TMTNitoModule.m
$(BUNDLE_NAME)_INSTALL_PATH = /Library/TVSystemMenuModules
$(BUNDLE_NAME)_FRAMEWORKS = UIKit Foundation CoreFoundation CoreServices
$(BUNDLE_NAME)_PRIVATE_FRAMEWORKS = TVSystemMenuUI PineBoardServices
$(BUNDLE_NAME)_CFLAGS = -fobjc-arc  -F. -I.
$(BUNDLE_NAME)_LDFLAGS +=  -F. -I.

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/TVSystemMenuModules$(ECHO_END)
	
