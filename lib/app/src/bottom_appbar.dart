import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:themes/buttons/rounded_button.dart';
import 'package:themes/default_widgets/custom_bottom_appbar.dart';
import 'package:themes/theme/app_colors.dart';

class CustomBottomBar extends StatelessWidget {
  final VoidCallback on1;
  final VoidCallback on2;
  final VoidCallback on3;
  const CustomBottomBar({
    Key? key,
    required this.on1,
    required this.on2,
    required this.on3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBottomAppBar(
      items: [
        RoundedButton(
          onPressed: on1,
          color: AppColors.primaryColor,
          size: 35.0,
          icon: Icons.chat,
        ),
        RoundedButton(
          onPressed: on2,
          color: AppColors.primaryColor,
          size: 35.0,
          icon: Icons.home,
        ),
        RoundedButton(
          onPressed: on3,
          color: AppColors.primaryColor,
          size: 35.0,
          icon: Icons.person,
        ),
      ],
    );
  }
}
