import '../../../../socket/socket_manager.dart';

class SocketRepository {
  void connect(
    String ip,
    int port,
    OnConnected onConnected,
    OnConnecting onConnecting,
    OnDisConnected onDisConnected,
  ) {
    SocketManager.instance.connect(
      ip: ip,
      port: port,
      onConnected: onConnected,
      onConnecting: onConnecting,
      onDisConnected: onDisConnected,
    );
  }
}
