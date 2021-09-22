import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

class BaseCard extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onTap;
  const BaseCard({
    Key? key,
    required this.image,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sh = MediaQuery.of(context).size.height;
    var sw = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(right: 10, top: 10, bottom: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          width: sw * .6,
          height: sh * .2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: Colors.black87,
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: AppTextStyle.primaryButtonTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(
                image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
