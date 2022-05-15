import 'dart:convert';

import '../../../../socket/socket_manager.dart';
import '../source/source/list_posts_request.dart';
import '../source/source/list_posts_response.dart';

typedef ListPostsCallback = Function(List<ListPostsResponse> posts);

class PostsRepository {
  void getListPosts(ListPostsCallback callback) {
    return SocketManager.instance.send(ListPostsRequest(), (response) {
      var json = jsonDecode(response);
      List<ListPostsResponse> posts = (json as List)
          .map((item) => ListPostsResponse.fromJson(item))
          .toList();
      callback(posts);
    });
  }
}
