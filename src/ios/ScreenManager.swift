import UIKit
import CoreMotion

@objc(ScreenManager) class ScreenManager: CDVPlugin {
    
    @objc(rotate:)
    func rotate(command: CDVInvokedUrlCommand) {
        let orientation = command.arguments[0] as? String ?? "unspecified"
        self.setOrientation(orientation: orientation)
        self.commandDelegate.send(CDVPluginResult(status: CDVCommandStatus_OK), callbackId: command.callbackId)
    }
    
    @objc(lock:)
    func lock(command: CDVInvokedUrlCommand) {
        let orientation = command.arguments[0] as? String ?? "unspecified"
        self.lockOrientation(orientation: orientation)
        self.commandDelegate.send(CDVPluginResult(status: CDVCommandStatus_OK), callbackId: command.callbackId)
    }
    
    @objc(unlock:)
    func unlock(command: CDVInvokedUrlCommand) {
        self.unlockOrientation()
        self.commandDelegate.send(CDVPluginResult(status: CDVCommandStatus_OK), callbackId: command.callbackId)
    }
    
    private func setOrientation(orientation: String) {
        DispatchQueue.main.async {
            switch orientation {
            case "landscape-left":
                UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
                UINavigationController.attemptRotationToDeviceOrientation()
            case "landscape-right":
                UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
                UINavigationController.attemptRotationToDeviceOrientation()
            case "portrait":
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                UINavigationController.attemptRotationToDeviceOrientation()
            default:
                break
            }
        }
    }
    
    private func lockOrientation(orientation: String) {
        setOrientation(orientation: orientation)
    }
    
    private func unlockOrientation() {
        DispatchQueue.main.async {
            UIDevice.current.setValue(UIInterfaceOrientation.unknown.rawValue, forKey: "orientation")
            UINavigationController.attemptRotationToDeviceOrientation()
        }
    }
}
