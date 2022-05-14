import 'package:flutter/material.dart';

class ListPostsScreen extends StatefulWidget {
  const ListPostsScreen({Key? key}) : super(key: key);

  @override
  _ListPostsScreenState createState() => _ListPostsScreenState();
}

class _ListPostsScreenState extends State<ListPostsScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("LIST POSTS"),
        ),
      ),
    );
  }
}
