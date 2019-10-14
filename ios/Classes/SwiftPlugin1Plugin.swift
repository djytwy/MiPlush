import Flutter
import UIKit

public class SwiftPlugin1Plugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "plugin1", binaryMessenger: registrar.messenger())
    let instance = SwiftPlugin1Plugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
  
    private var msg:Any = "";

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch (call.method) {
    case "test":
        result("由iOS返回的信息")
    case "setVal":
        self.setVal(call, result: result)
    case "getVal":
        result(msg)
    case "getPlatformVersion":
        result("iOS " + UIDevice.current.systemVersion)
    default:
        result(FlutterMethodNotImplemented)
    }
  }
    
    public func setVal(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        print("IOS内输出：\(call.arguments ?? "")")
        msg = call.arguments ?? "暂无"
    }
}
