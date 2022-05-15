import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/list_posts_use_case.dart';
import 'list_posts_state.dart';

class ListPostsCubit extends Cubit<ListPostsState> {
  ListPostsCubit() : super(ListPostsState.initial());

  void getPosts() {
    ListPostsUseCase().getListPosts((posts) {
      String aa = "";
    });
  }
}
