#import "BlueDatetimePickerPlugin.h"
#if __has_include(<blue_datetime_picker_plugin/blue_datetime_picker_plugin-Swift.h>)
#import <blue_datetime_picker_plugin/blue_datetime_picker_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "blue_datetime_picker_plugin-Swift.h"
#endif

@implementation BlueDatetimePickerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBlueDatetimePickerPlugin registerWithRegistrar:registrar];
}
@end
