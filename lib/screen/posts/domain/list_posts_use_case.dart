import 'package:socket_example/screen/posts/data/repository/posts_repository.dart';

class ListPostsUseCase {
  void getListPosts(ListPostsCallback callback) {
    return PostsRepository().getListPosts(callback);
  }
}
