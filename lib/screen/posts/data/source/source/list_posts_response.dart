class ListPostsResponse {
  final String name;
  final String logo;
  final bool isVerified;
  final String username;
  final String imageUrl;
  final int countComment;
  final int countLike;
  final bool isLike;
  final bool isFavorite;

  ListPostsResponse({
    required this.name,
    required this.logo,
    required this.isVerified,
    required this.username,
    required this.imageUrl,
    required this.countComment,
    required this.countLike,
    required this.isLike,
    required this.isFavorite,
  });

  factory ListPostsResponse.fromJson(Map<String, dynamic> json) {
    return ListPostsResponse(
      name: json['name'],
      logo: json['logo'],
      isVerified: json['is_verified'],
      username: json['username'],
      imageUrl: json['image_url'],
      countComment: json['count_comment'],
      countLike: json['count_like'],
      isLike: json['is_like'],
      isFavorite: json['is_favorite'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "logo": logo,
      "is_verified": isVerified,
      "username": username,
      "image_url": imageUrl,
      "count_comment": countComment,
      "count_like": countLike,
      "is_like": isLike,
      "is_favorite": isFavorite,
    };
  }
}
