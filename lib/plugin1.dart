import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Plugin1 {
  static const MethodChannel _channel = const MethodChannel('plugin1');
  String platform = '这里将显示消息';

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get test async {
    final String test = await _channel.invokeMethod('test');
    return test;
  }

  static Future<String> get getVal async {
    final String val = await _channel.invokeMethod('getVal');
    return val;
  }

  static Future<void> setVal({@required String android, @required String ios}) async {
    if(Platform.isAndroid) await _channel.invokeMethod('setVal', android);
    if(Platform.isIOS) await _channel.invokeMethod('setVal', ios);
  }

}
