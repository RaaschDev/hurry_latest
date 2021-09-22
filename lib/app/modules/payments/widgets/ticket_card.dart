import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

class TicketCard extends StatelessWidget {
  final String text;
  final String value;
  final VoidCallback onTap;
  const TicketCard({
    Key? key,
    required this.text,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, top: 10, left: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 180,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.primaryColor, width: 2)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  text,
                  style: AppTextStyle.primaryButtonTextStyle,
                ),
              ),
              Container(
                width: 120,
                child: Center(
                  child: Text(
                    'R\$$value',
                    style: AppTextStyle.primaryButtonTextStyle,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
