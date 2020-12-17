#import "ImagePickerFormFieldPlugin.h"
#if __has_include(<image_picker_form_field/image_picker_form_field-Swift.h>)
#import <image_picker_form_field/image_picker_form_field-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "image_picker_form_field-Swift.h"
#endif

@implementation ImagePickerFormFieldPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftImagePickerFormFieldPlugin registerWithRegistrar:registrar];
}
@end
