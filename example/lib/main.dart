import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:plugin1/plugin1.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _test = '';
  String platform = '';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    String test;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Plugin1.platformVersion;
      test = await Plugin1.test;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _test = test;
    });
  }

  void sendToDevice() {
    Plugin1.setVal(ios: '这条消息从flutter到IOS再到flutter',android: '这条消息从flutter到Android再到flutter');
    getPlatform();
  }

  Future<void> getPlatform() async {
    String _val = await Plugin1.getVal;
    setState(() {
      platform = _val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('Running on: $_platformVersion\n'),
              Text(_test),
              RaisedButton(
                child: Text('点击向设备发信息'),
                onPressed: (){sendToDevice();},
              ),
              Text(platform)
            ],
          ) 
        ),
      ),
    );
  }
}
