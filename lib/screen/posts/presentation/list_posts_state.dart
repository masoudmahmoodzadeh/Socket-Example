import 'package:equatable/equatable.dart';
import 'package:socket_example/screen/posts/data/source/source/list_posts_response.dart';

import '../../../base/base_state.dart';
import '../../../base/base_status.dart';

class ListPostsState extends Equatable implements BaseState {
  final List<ListPostsResponse> response;
  final BaseStatus status;

  const ListPostsState({
    required this.response,
    required this.status,
  });

  ListPostsState copyWith({
    List<ListPostsResponse>? response,
    BaseStatus? status,
  }) {
    return ListPostsState(
      response: response ?? this.response,
      status: status ?? this.status,
    );
  }

  static ListPostsState initial() {
    return ListPostsState(
      response: [],
      status: InitialStatus(),
    );
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
  List<Object?> get props => [response, status];
}
