import 'package:equatable/equatable.dart';

import '../../../base/base_state.dart';
import '../../../base/base_status.dart';

class SocketConfigState extends Equatable implements BaseState {
  final String ip;
  final int port;
  final BaseStatus? status;

  const SocketConfigState({
    required this.ip,
    required this.port,
    required this.status,
  });

  SocketConfigState copyWith({
    String? ip,
    int? port,
    BaseStatus? status,
  }) {
    return SocketConfigState(
      ip: ip ?? this.ip,
      port: port ?? this.port,
      status: status ?? this.status,
    );
  }

  static SocketConfigState initial() {
    return SocketConfigState(ip: '', port: 0, status: InitialStatus());
  }

  @override
  List<Object?> get props => [ip, port, status];

  @override
  bool isLoading() {
    return status is LoadingStatus;
  }

  @override
  bool isSuccess() {
    return status is SuccessStatus;
  }

  @override
  bool isError() {
    return status is FailedStatus;
  }

  @override
  String getErrorMessage() {
    if (isError()) {
      FailedStatus state = status as FailedStatus;
      return state.exception;
    } else {
      return "";
    }
  }
}

class EnterIpStatus extends BaseStatus {}

class EnterPortStatus extends BaseStatus {}



