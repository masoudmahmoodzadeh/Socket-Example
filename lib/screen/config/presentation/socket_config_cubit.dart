import 'package:bloc/bloc.dart';
import 'package:socket_example/base/base_status.dart';
import 'package:socket_example/screen/config/domain/socket_config_use_case.dart';
import 'package:socket_example/screen/config/presentation/socket_config_state.dart';
import 'package:socket_example/socket/socket_manager.dart';

class SocketConfigCubit extends Cubit<SocketConfigState> {

  SocketConfigCubit() : super(SocketConfigState.initial());

  void setIp(String ip) {
    emit(state.copyWith(ip: ip, status: EnterIpStatus()));
  }

  void setPort(int port) {
    emit(state.copyWith(port: port, status: EnterPortStatus()));
  }

  void connect() {
    SocketConfigUseCase().connect(
      ip: state.ip,
      port: state.port,
      onConnected: (id) {
        emit(state.copyWith(status: SuccessStatus()));
      },
      onConnecting: () {
        emit(state.copyWith(status: LoadingStatus()));
      },
      onDisConnected: () {
        emit(state.copyWith(status: FailedStatus("Socket disconnected....")));
      },
    );
  }

  void isConnect(){
    bool isConnected = SocketManager.instance.socket.connected;
    print(isConnected);
  }
}
