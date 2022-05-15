import 'package:flutter/material.dart';

import '../data/source/source/list_posts_response.dart';

class ListPostsListItem extends StatelessWidget {
  final ListPostsResponse item;

  const ListPostsListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const SizedBox(height: 16),
          _buildHeader(),
          const SizedBox(height: 16),
          _buildImage(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 8),
        _buildLogo(),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildName(),
                  _buildVerified(),
                ],
              ),
              _buildUsername(),
            ],
          ),
        ),
        _buildMore(),
      ],
    );
  }

  Widget _buildLogo() {
    return Image(
      image: NetworkImage(item.logo),
      width: 40,
      height: 40,
    );
  }

  Widget _buildName() {
    return Text(
      item.name,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildUsername() {
    return Text(item.username);
  }

  Widget _buildVerified() {
    return Visibility(
        visible: item.isVerified,
        child: const Icon(
          Icons.check_circle,
          color: Colors.blue,
        ));
  }

  Widget _buildMore() {
    return const Icon(
      Icons.more_vert,
      size: 30,
      color: Colors.grey,
    );
  }

  Widget _buildImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image(image: NetworkImage(item.imageUrl)),
          ),
          _buildStatistics(),
        ],
      ),
    );
  }

  Widget _buildStatistics() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 50,
      decoration: BoxDecoration(color: Colors.grey.shade200.withOpacity(0.7)),
      child: Row(
        children: [
          Row(
            children: [
              const Icon(Icons.mode_comment_outlined, color: Colors.black),
              const SizedBox(width: 8),
              Text(item.countComment.toString())
            ],
          ),
          const SizedBox(width: 16),
          Row(
            children: [
              Icon(Icons.favorite,
                  color: item.isLike ? Colors.red : Colors.grey),
              const SizedBox(width: 8),
              Text(item.countLike.toString())
            ],
          ),
          const SizedBox(width: 16),
          const Icon(Icons.send, color: Colors.black),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.bookmark,
                color: item.isFavorite
                    ? Colors.black
                    : Colors.black.withOpacity(0.3),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
