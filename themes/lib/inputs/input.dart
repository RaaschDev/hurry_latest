import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

class Input extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool obscure;
  const Input({
    Key? key,
    required this.hint,
    required this.controller,
    required this.obscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
