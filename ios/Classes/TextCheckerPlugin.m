#import "TextCheckerPlugin.h"
#if __has_include(<text_checker/text_checker-Swift.h>)
#import <text_checker/text_checker-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "text_checker-Swift.h"
#endif

@implementation TextCheckerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTextCheckerPlugin registerWithRegistrar:registrar];
}
@end
