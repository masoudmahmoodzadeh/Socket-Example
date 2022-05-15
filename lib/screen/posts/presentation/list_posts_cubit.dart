import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_example/base/base_status.dart';

import '../domain/list_posts_use_case.dart';
import 'list_posts_state.dart';

class ListPostsCubit extends Cubit<ListPostsState> {
  ListPostsCubit() : super(ListPostsState.initial());

  void getPosts() {
    emit(state.copyWith(status: LoadingStatus()));
    ListPostsUseCase().getListPosts((posts) {
      emit(state.copyWith(
        response: posts,
        status: SuccessStatus(),
      ));
    });
  }
}
