import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_screenshot_callback/screenshot_callback.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> implements IScreenshotCallback {
  String _imagePath = 'Unknown';
  ScreenshotCallback _screenshotCallback;

  @override
  void initState() {
    super.initState();
    initCallback();
  }

  void initCallback(){
    _screenshotCallback = ScreenshotCallback();
    _screenshotCallback.startScreenshot();
    _screenshotCallback.setInterfaceScreenshotCallback(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _screenshotCallback.stopScreenshot();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Image path: $_imagePath\n'),
        ),
      ),
    );
  }

  @override
  deniedPermission() {
    print("没有权限");
  }

  @override
  screenshotCallback(String data) {
    setState(() {
      _imagePath = data;
    });
  }
}
