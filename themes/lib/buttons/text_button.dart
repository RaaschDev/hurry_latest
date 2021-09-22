import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

class ButtomText extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const ButtomText({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyle.primaryButtonTextStyle,
        ));
  }
}
