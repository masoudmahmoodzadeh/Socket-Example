import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_example/screen/config/presentation/socket_config_cubit.dart';

import 'screen/config/presentation/socket_config_screen.dart';
import 'util/theme_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SocketConfigCubit>(
      create: (BuildContext context) => SocketConfigCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeManager().create(),
        home: const SocketConfigScreen(),
      ),
    );
  }
}
