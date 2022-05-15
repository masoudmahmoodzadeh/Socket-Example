import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvg extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final Color? color;

  const CustomSvg({
    Key? key,
    required this.path,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      fit: BoxFit.cover,
      color: color,
      alignment: Alignment.center,
    );
  }
}
