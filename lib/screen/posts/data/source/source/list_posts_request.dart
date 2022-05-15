import '../../../../../socket/base_request_socket.dart';

class ListPostsRequest extends BaseRequestSocket {
  @override
  String getRequestEvent() {
    return "listPosts";
  }

  @override
  String getResponseEvent() {
    return "listPosts";
  }

  @override
  bool isHasResponse() {
    return true;
  }

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
