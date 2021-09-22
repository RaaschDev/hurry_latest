import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      color: AppColors.backGroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.qr_code_2,
              size: 250,
              color: Colors.white,
            ),
            Text(
              'E ainda pode comprar suas bebidas e comidas sem pegar filas!',
              textAlign: TextAlign.center,
              style: WelcomeTextStyle.primaryTitleStyle,
            ),
          ],
        ),
      ),
    );
  }
}
