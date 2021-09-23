import 'package:flutter/material.dart';
import 'package:themes/theme/app_colors.dart';
import 'package:themes/theme/app_text.dart';

class HeaderWidget extends StatelessWidget {
  final String description;
  final String? date;
  final String? start;
  final String? end;
  final String? city;
  final String? complement;
  final String? value;

  const HeaderWidget({
    Key? key,
    required this.description,
    this.date,
    this.start,
    this.end,
    this.city,
    this.complement,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sh = MediaQuery.of(context).size.height;
    var sw = MediaQuery.of(context).size.width;
    return Container(
      height: sh * .2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description,
            style: AppTextStyle.primaryTitleStyle,
            textScaleFactor: 1.2,
          ),
          SizedBox(
            height: 20,
          ),
          date != null
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '$date - $start ate $end',
                        style: AppTextStyle.accentButtonTextStyle,
                      ),
                    ],
                  ),
                )
              : Row(
                  children: [
                    Icon(
                      Icons.paid_sharp,
                      color: AppColors.primaryColor,
                    ),
                    Text(
                      '$value',
                      style: AppTextStyle.accentTitleStyle,
                    )
                  ],
                ),
          date != null
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '$city - $complement',
                        style: AppTextStyle.accentButtonTextStyle,
                      ),
                    ],
                  ),
                )
              : SizedBox(),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: Colors.white,
            height: 4,
          )
        ],
      ),
    );
  }
}
