import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_example/base/base_colors.dart';
import 'package:socket_example/screen/posts/data/source/source/list_posts_response.dart';
import 'package:socket_example/screen/posts/presentation/list_post_list_item.dart';

import 'list_posts_cubit.dart';
import 'list_posts_state.dart';

class ListPostsScreen extends StatelessWidget {
  const ListPostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListPostsCubit cubit = ListPostsCubit();
    cubit.getPosts();
    return BlocProvider<ListPostsCubit>(
      create: (context) => cubit,
      child: const _ListPostView(),
    );
  }
}

class _ListPostView extends StatelessWidget {
  const _ListPostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BaseColors.primary,
        body: BlocBuilder<ListPostsCubit, ListPostsState>(
          builder: (context, state) {
            if (state.isLoading()) {
              return const CircularProgressIndicator();
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.response.length,
              itemBuilder: (context, index) {
                ListPostsResponse item = state.response[index];
                return ListPostsListItem(item: item);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Colors.transparent,
                  height: 20,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
