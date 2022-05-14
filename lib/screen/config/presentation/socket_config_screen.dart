import 'package:flutter/material.dart';

import '../../../base/base_colors.dart';
import '../../../base/widgets/custom_ip_field.dart';
import '../../../base/widgets/custom_port_field.dart';
import '../../../base/widgets/gradient_button.dart';
import '../../../socket/socket_manager.dart';
import '../../posts/presentation/ListPostsScreen.dart';

class SocketConfigScreen extends StatefulWidget {
  const SocketConfigScreen({Key? key}) : super(key: key);

  @override
  _SocketConfigScreenState createState() => _SocketConfigScreenState();
}

class _SocketConfigScreenState extends State<SocketConfigScreen> {
  var ipController = TextEditingController();
  var portController = TextEditingController();
  bool isSocketConnecting = false;

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
    return isSocketConnecting
        ? const CircularProgressIndicator()
        : GradientButton(
            onPressed: () {
              String ip = ipController.text;
              int port = int.parse(portController.text);
              SocketManager socketManager = SocketManager(ip, port);
              socketManager.connect(
                onConnected: (String? id) {
                  setState(() {
                    isSocketConnecting = false;
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListPostsScreen(),
                        ));
                  });
                },
                onConnecting: () {
                  setState(() {
                    isSocketConnecting = true;
                  });
                },
                onDisConnected: () {
                  setState(() {
                    isSocketConnecting = false;
                  });
                },
              );
            },
            title: 'Connect',
          );
  }
}
