import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_example/base/widgets/gradient_button.dart';

import 'list_posts_cubit.dart';
import 'list_posts_state.dart';

class ListPostsScreen extends StatelessWidget {
  const ListPostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListPostsCubit>(
      create: (context) => ListPostsCubit(),
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
        body: BlocBuilder<ListPostsCubit, ListPostsState>(
          builder: (context, state) {
            return Center(
              child: GradientButton(
                  title: "Test",
                  onPressed: () {
                    context.read<ListPostsCubit>().getPosts();
                  }),
            );
          },
        ),
      ),
    );
    ;
  }
}
