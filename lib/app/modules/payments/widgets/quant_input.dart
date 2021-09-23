import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

class QuantInput extends StatelessWidget {
  final String value;
  final String qnt;
  final VoidCallback max;
  final VoidCallback min;
  const QuantInput({
    Key? key,
    required this.value,
    required this.qnt,
    required this.max,
    required this.min,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sh = MediaQuery.of(context).size.height;
    return Container(
      child: Container(
        height: sh * .2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quantidade',
              style: AppTextStyle.primaryTitleStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 100,
                  child: Center(
                      child: Text(
                    'R\$$value',
                    style: AppTextStyle.accentTitleStyle,
                  )),
                )),
                Expanded(
                    child: Container(
                  height: 100,
                  child: Row(
                    children: [
                      MaterialButton(
                        onPressed: max,
                        color: AppColors.primaryColor,
                        height: 56,
                        minWidth: 56,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.minimize,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                          child: Center(
                              child: Text(
                        '$qnt',
                        style: AppTextStyle.accentTitleStyle,
                      ))),
                      MaterialButton(
                        onPressed: min,
                        color: AppColors.primaryColor,
                        height: 56,
                        minWidth: 56,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
