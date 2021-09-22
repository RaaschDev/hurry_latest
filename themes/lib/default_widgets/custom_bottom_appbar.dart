import 'package:flutter/material.dart';
// import 'package:themes/themes.dart';

class CustomBottomAppBar extends StatelessWidget {
  final List<Widget> items;
  const CustomBottomAppBar({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sh = MediaQuery.of(context).size.height;
    // var sw = MediaQuery.of(context).size.width;
    // var padding = MediaQuery.of(context).padding.top;
    return Container(
      height: sh * .15,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }
}
