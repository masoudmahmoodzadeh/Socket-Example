import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/base_colors.dart';
import '../../../base/widgets/custom_ip_field.dart';
import '../../../base/widgets/custom_port_field.dart';
import '../../../base/widgets/custom_svg.dart';
import '../../../base/widgets/gradient_button.dart';
import '../../../util/drawable_manager.dart';
import '../../posts/presentation/list_posts_screen.dart';
import 'socket_config_cubit.dart';
import 'socket_config_state.dart';

class SocketConfigScreen extends StatelessWidget {
  const SocketConfigScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SocketConfigCubit>(
      create: (BuildContext context) => SocketConfigCubit(),
      child: _ConfigView(),
    );
  }
}

class _ConfigView extends StatelessWidget {
  final ipController = TextEditingController();
  final portController = TextEditingController();

  _ConfigView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BaseColors.primary,
        body: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            const CustomSvg(path: DrawableManager.bgAbstractLines),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLogo(),
                  const SizedBox(height: 16),
                  _buildTitle(),
                  const SizedBox(height: 16),
                  _buildIp(context),
                  const SizedBox(height: 16),
                  _buildPort(context),
                  const SizedBox(height: 32),
                  _buildBtnConnect(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return const Image(
      image: AssetImage(DrawableManager.icSocket),
      width: 70,
      height: 70,
    );
  }

  Widget _buildTitle() {
    return const Text(
      "Socket Configuration",
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildIp(BuildContext context) {
    return CustomIpField(
      controller: ipController,
      onChanged: (String ip) {
        context.read<SocketConfigCubit>().setIp(ip);
      },
    );
  }

  Widget _buildPort(BuildContext context) {
    return CustomPortField(
      controller: portController,
      onChanged: (String port) {
        context.read<SocketConfigCubit>().setPort(int.parse(port));
      },
    );
  }

  Widget _buildBtnConnect(BuildContext context) {
    return BlocConsumer<SocketConfigCubit, SocketConfigState>(
        builder: (context, state) {
      if (state.isLoading()) {
        return const CircularProgressIndicator();
      } else {
        return GradientButton(
          onPressed: () {
            context.read<SocketConfigCubit>().connect();
          },
          title: 'Connect',
        );
      }
    }, listener: (context, state) {
      if (state.isSuccess()) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ListPostsScreen(),
            ));
      }
    });
  }
}
