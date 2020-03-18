#import "LinksaplicativosPlugin.h"
#if __has_include(<linksaplicativos/linksaplicativos-Swift.h>)
#import <linksaplicativos/linksaplicativos-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "linksaplicativos-Swift.h"
#endif

@implementation LinksaplicativosPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLinksaplicativosPlugin registerWithRegistrar:registrar];
}
@end
