# Socket Example

developed with **Flutter**

## Technologies

- **Clean Architecture**
- **[Bloc](https://pub.dev/packages/flutter_bloc)**
- **[Socket Io Client](https://pub.dev/packages/socket_io_client)**
- **[Equatable](https://pub.dev/packages/equatable)**


## Usage

Each request must inherit from the **BaseRequestSocket**

~~~dart
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
~~~ 

then send to **SocketManager**

~~~ dart
SocketManager.instance.send(ListPostsRequest(), (response) {
      var json = jsonDecode(response);
      List<ListPostsResponse> posts = (json as List)
          .map((item) => ListPostsResponse.fromJson(item))
          .toList();
      callback(posts);
    })
~~~


## Screenshots

![Screenshot-01](/screenshots/screenshot-01.png)

![Screenshot-02](/screenshots/screenshot-02.png)



