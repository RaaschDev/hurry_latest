import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

class BorderButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const BorderButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.maxFinite,
      height: 62,
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyle.primaryButtonTextStyle,
      ),
      color: AppColors.backGroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: AppColors.primaryColor,
          style: BorderStyle.solid,
          width: 2,
        ),
      ),
    );
  }
}
