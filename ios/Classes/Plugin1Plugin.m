#import "Plugin1Plugin.h"
#import <plugin1/plugin1-Swift.h>
#import <objc/runtime.h>

@implementation Plugin1Plugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPlugin1Plugin registerWithRegistrar:registrar];
}
@end
