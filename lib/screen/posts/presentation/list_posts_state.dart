import 'package:equatable/equatable.dart';

import '../../../base/base_state.dart';
import '../../../base/base_status.dart';

class ListPostsState extends Equatable implements BaseState {
  final BaseStatus status;

  const ListPostsState({
    required this.status,
  });

  ListPostsState copyWith({
    BaseStatus? status,
  }) {
    return ListPostsState(
      status: status ?? this.status,
    );
  }

  static ListPostsState initial() {
    return ListPostsState(status: InitialStatus());
  }

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

  @override
  List<Object?> get props => [status];
}
