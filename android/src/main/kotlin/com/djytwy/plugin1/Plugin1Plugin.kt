package com.djytwy.plugin1

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class Plugin1Plugin: MethodCallHandler {
  var getVal: Any = "";
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "plugin1")
      channel.setMethodCallHandler(Plugin1Plugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if (call.method == "test") {
      result.success("由安卓原生返回的消息！")
    } else if (call.method == "setVal") {
      setVal(call, result)
    } else if (call.method == "getVal") {
      result.success(getVal)
    } else {
      result.notImplemented()
    }
  }

  fun setVal(call: MethodCall, result: Result) {
    println("安卓内输出：" + call.arguments)
    getVal = call.arguments
  }
}
