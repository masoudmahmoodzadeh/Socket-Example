import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_posts_state.dart';

class ListPostsCubit extends Cubit<ListPostsState> {
  ListPostsCubit() : super(ListPostsState.initial());

  void getPosts() {}
}
