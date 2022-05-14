import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:socket_example/socket/socket_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  SocketManager socketManager = SocketManager("http://192.168.10.248", 5000);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    widget.socketManager.connect(
      onConnected: (String? id) {
        if (kDebugMode) {
          print("Socket Connected. id = $id");
        }
      },
      onConnecting: () {
        if (kDebugMode) {
          print("Socket onConnecting...");
        }
      },
      onDisConnected: () {
        if (kDebugMode) {
          print("Socket Disconnected");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Socket Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[Text('TEST')],
        ),
      ),
    );
  }
}
