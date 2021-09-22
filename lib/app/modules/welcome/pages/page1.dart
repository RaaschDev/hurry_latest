import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      color: AppColors.primaryColor,
      child: Center(
        child: Text(
          'Você esta pronto para o melhor app de eventosjá criado?',
          textAlign: TextAlign.center,
          style: WelcomeTextStyle.accentTitleStyle,
        ),
      ),
    );
  }
}
