import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:socket_example/base/base_colors.dart';
import 'package:socket_example/base/widgets/gradient_button.dart';

import '../../../base/widgets/custom_ip_field.dart';
import '../../../base/widgets/custom_port_field.dart';
import '../../../socket/socket_manager.dart';

class SocketConfigScreen extends StatefulWidget {
  const SocketConfigScreen({Key? key}) : super(key: key);

  @override
  _SocketConfigScreenState createState() => _SocketConfigScreenState();
}

class _SocketConfigScreenState extends State<SocketConfigScreen> {
  var ipController = TextEditingController();
  var portController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BaseColors.primary,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIp(),
              const SizedBox(height: 16),
              _buildPort(),
              const SizedBox(height: 32),
              _buildBtnConnect(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIp() {
    return CustomIpField(controller: ipController);
  }

  Widget _buildPort() {
    return CustomPortField(
      controller: portController,
    );
  }

  Widget _buildBtnConnect() {
    return GradientButton(
      onPressed: () {
        SocketManager socketManager =
            SocketManager(ipController.text, int.parse(portController.text));
        socketManager.connect(
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
      },
      title: 'Connect',
    );
  }
}
