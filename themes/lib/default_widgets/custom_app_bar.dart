import 'package:flutter/material.dart';
import 'package:themes/default_widgets/photo_avatar.dart';
import 'package:themes/themes.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  final String? image;
  final VoidCallback onTap;
  const CustomAppBar({
    Key? key,
    required this.text,
    this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sh = MediaQuery.of(context).size.height;
    // var sw = MediaQuery.of(context).size.width;
    var padding = MediaQuery.of(context).padding.top;
    return Container(
      height: sh * .18,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppTextStyle.accentTitleStyle,
          ),
          image == ''
              ? PhotoAvatar(
                  onTap: onTap,
                  image: image!,
                )
              : SizedBox()
        ],
      ),
    );
  }
}
