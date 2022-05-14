abstract class BaseRequestSocket {
  String getRequestEvent();

  String getResponseEvent();

  bool isHasResponse();

  Map<String, dynamic> toJson();
}
