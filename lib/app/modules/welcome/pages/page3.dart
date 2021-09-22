import 'package:flutter/material.dart';
import 'package:themes/theme/app_colors.dart';
import 'package:themes/theme/app_text.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      color: AppColors.primaryColor,
      child: Center(
        child: Text(
          'E ainda pode dar um match com as pessoas do evento',
          textAlign: TextAlign.center,
          style: WelcomeTextStyle.accentTitleStyle,
        ),
      ),
    );
  }
}
