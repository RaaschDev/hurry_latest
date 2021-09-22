import 'package:flutter/material.dart';
import 'package:themes/theme/app_colors.dart';
import 'package:themes/theme/app_text.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      color: AppColors.backGroundColor,
      child: Center(
        child: Text(
          'E ainda pode comprar suas bebidas e comidas sem pegar filas!',
          textAlign: TextAlign.center,
          style: WelcomeTextStyle.primaryTitleStyle,
        ),
      ),
    );
  }
}
