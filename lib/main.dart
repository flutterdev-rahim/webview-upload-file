import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Permission.camera.request();
  await Permission.microphone.request();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' TAMAM SELLER',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Tamam Seller Lap',style: TextStyle(color: Colors.black),),
      //   centerTitle: true,
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),
      body: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              return InAppWebView(
                // contextMenu: contextMenu,
                initialUrlRequest:
                    URLRequest(url: Uri.parse("https://tamampk.com/app/seller/login")),
                // initialFile: "assets/index.html",
                //initialUserScripts: UnmodifiableListView<UserScript>([]),
             androidOnPermissionRequest:
                    (controller, origin, resources) async {
                  return PermissionRequestResponse(
                      resources: resources,
                      action: PermissionRequestResponseAction.GRANT);
                }, );
              //  WebView(
              //   debuggingEnabled: true,
              //   gestureNavigationEnabled: true,
              //   initialUrl: 'https://tamampk.com/app/seller/login',
              //   // Enable Javascript on WebView
              //   javascriptMode: JavascriptMode.unrestricted,
              //   onWebViewCreated: (WebViewController webViewController) {
              //     _controller.complete(webViewController);
              //   },
              // );
            },
          ),
        ),
      ),
    );
  }
}
