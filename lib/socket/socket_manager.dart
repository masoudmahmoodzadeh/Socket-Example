import 'package:socket_example/socket/base_request_socket.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

typedef OnConnected = Function(String? id);
typedef OnConnecting = Function();
typedef OnDisConnected = Function();
typedef OnReceive = Function(dynamic data);

class SocketManager {
  late String ip;
  final int port;
  late IO.Socket socket;

  SocketManager(this.ip, this.port);

  void connect({
    required OnConnected onConnected,
    required OnConnecting onConnecting,
    required OnDisConnected onDisConnected,
  }) {
    var options = {
      "transports": ["websocket"],
      "autoConnect": false,
    };

    String protocol = "";
    if (!ip.startsWith("http")) {
      protocol = "http://";
    }

    socket = IO.io('$protocol$ip:$port', options);
    socket.onConnect((_) {
      onConnected(socket.id);
    });
    socket.onConnecting((data) {
      onConnecting();
    });
    socket.onDisconnect((_) {
      onDisConnected();
    });

    socket.connect();
  }

  void send(BaseRequestSocket req, OnReceive onReceive) {
    socket.connect();
    socket.emit(req.getRequestEvent(), req.toJson());
    bool isHasResponseListener = socket.hasListeners(req.getResponseEvent());
    if (req.isHasResponse() && !isHasResponseListener) {
      socket.on(req.getResponseEvent(), (data) => onReceive(data));
    }
  }

  void receive(String event, OnReceive onReceive) {
    socket.connect();
    socket.on(event, (response) => onReceive(response));
  }
}
