#import "LlyColorplatePlugin.h"
#if __has_include(<lly_colorplate/lly_colorplate-Swift.h>)
#import <lly_colorplate/lly_colorplate-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "lly_colorplate-Swift.h"
#endif

@implementation LlyColorplatePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLlyColorplatePlugin registerWithRegistrar:registrar];
}
@end
