import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyle.accentButtonTextStyle,
      ),
      height: 50,
      minWidth: double.maxFinite,
      color: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
