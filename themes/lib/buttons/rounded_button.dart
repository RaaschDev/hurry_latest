import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final icon;
  final size;
  final color;
  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
      height: 60,
      minWidth: 60,
      elevation: 0,
      color: AppColors.backGroundColor.withOpacity(.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
