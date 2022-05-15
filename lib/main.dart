import 'package:flutter/material.dart';

import 'screen/config/presentation/socket_config_screen.dart';
import 'util/theme_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeManager().create(),
      home: const SocketConfigScreen(),
    );
  }
}
