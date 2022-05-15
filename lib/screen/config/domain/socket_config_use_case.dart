import 'package:socket_example/screen/config/data/repository/socket_repository.dart';

import '../../../socket/socket_manager.dart';

class SocketConfigUseCase {
  void connect({
    required String ip,
    required int port,
    required OnConnected onConnected,
    required OnConnecting onConnecting,
    required OnDisConnected onDisConnected,
  }) {
    SocketRepository().connect(
      ip,
      port,
      onConnected,
      onConnecting,
      onDisConnected,
    );
  }
}
