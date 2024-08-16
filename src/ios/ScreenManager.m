#import "ScreenManager.h"
#import <UIKit/UIKit.h>

@implementation ScreenManager

- (void)rotate:(CDVInvokedUrlCommand *)command {
    NSString *orientation = [command.arguments objectAtIndex:0];
    
    if ([orientation isEqualToString:@"landscape-left"]) {
        [self setOrientation:UIInterfaceOrientationLandscapeLeft];
    } else if ([orientation isEqualToString:@"landscape-right"]) {
        [self setOrientation:UIInterfaceOrientationLandscapeRight];
    } else if ([orientation isEqualToString:@"portrait"]) {
        [self setOrientation:UIInterfaceOrientationPortrait];
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)lock:(CDVInvokedUrlCommand *)command {
    NSString *orientation = [command.arguments objectAtIndex:0];
    
    if ([orientation isEqualToString:@"landscape-left"]) {
        [self setOrientation:UIInterfaceOrientationLandscapeLeft];
    } else if ([orientation isEqualToString:@"landscape-right"]) {
        [self setOrientation:UIInterfaceOrientationLandscapeRight];
    } else if ([orientation isEqualToString:@"portrait"]) {
        [self setOrientation:UIInterfaceOrientationPortrait];
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)unlock:(CDVInvokedUrlCommand *)command {
    // Unlocking can be implemented with a specific flag for orientation
    [self setOrientation:UIInterfaceOrientationUnknown];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setOrientation:(UIInterfaceOrientation)orientation {
    [[UIDevice currentDevice] setValue:@(orientation) forKey:@"orientation"];
    [UINavigationController attemptRotationToDeviceOrientation];
}

@end
