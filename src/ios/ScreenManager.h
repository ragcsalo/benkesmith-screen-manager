#import <Cordova/CDVPlugin.h>

@interface ScreenManager : CDVPlugin

- (void)rotate:(CDVInvokedUrlCommand *)command;
- (void)lock:(CDVInvokedUrlCommand *)command;
- (void)unlock:(CDVInvokedUrlCommand *)command;

@end

