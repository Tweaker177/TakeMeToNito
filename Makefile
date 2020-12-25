ARCHS = arm64
TARGET = appletv:clang

SYSROOT = $(THEOS)/sdks/AppleTVOS12.4.sdk
THEOS_DEVICE_IP = 192.168.x.xxx
INSTALL_TARGET_PROCESSES = TVSystemMenuService 

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = TakeMeToNito

TakeMeToNito_FILES =  TMTNitoModule.m
TakeMeToNito_INSTALL_PATH = /Library/TVSystemMenuModules
TakeMeToNito_FRAMEWORKS = UIKit Foundation CoreFoundation CoreServices
TakeMeToNito_PRIVATE_FRAMEWORKS = TVSystemMenuUI PineBoardServices
TakeMeToNito_CFLAGS = -fobjc-arc  -F. -I.
TakeMeToNito_LDFLAGS +=  -F. -I.

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/TVSystemMenuModules$(ECHO_END)
	