import 'package:flutter/material.dart';
import 'package:themes/theme/app_colors.dart';
import 'package:themes/theme/app_text.dart';

class ConsumableCard extends StatelessWidget {
  final String text;
  final String image;
  final String price;
  const ConsumableCard({
    Key? key,
    required this.text,
    required this.image,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: AppTextStyle.accentButtonTextStyle,
                  ),
                  Text(
                    price,
                    style: AppTextStyle.accentButtonTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
