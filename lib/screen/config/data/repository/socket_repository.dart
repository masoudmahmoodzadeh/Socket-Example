import '../../../../socket/socket_manager.dart';

class SocketRepository {
  void connect(
    SocketManager socketManager,
    String ip,
    int port,
    OnConnected onConnected,
    OnConnecting onConnecting,
    OnDisConnected onDisConnected,
  ) {
    socketManager.connect(
      ip: ip,
      port: port,
      onConnected: onConnected,
      onConnecting: onConnecting,
      onDisConnected: onDisConnected,
    );
  }
}
