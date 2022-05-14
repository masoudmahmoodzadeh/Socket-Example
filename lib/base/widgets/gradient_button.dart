import 'package:flutter/material.dart';

import '../base_colors.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final double? cornerRadius;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double? fontSize;

  const GradientButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.cornerRadius = 8,
      this.width,
      this.height = 50,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          colors: [
            BaseColors.violet,
            BaseColors.cyan,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: fontSize),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
