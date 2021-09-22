import 'package:flutter/material.dart';
import 'package:hurry/app/modules/welcome/config.dart';
import 'package:hurry/app/shared/models/category_model.dart';
import 'package:themes/theme/app_colors.dart';
import 'package:themes/theme/app_text.dart';
import 'package:themes/themes.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backGroundColor,
      child: Column(
        children: [
          Container(
            height: 250,
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Vamos nos conhecer melhor?',
                  style: AppTextStyle.accentTitleStyle,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Quais estilos você mais curte?',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.primaryTitleStyle,
                  textScaleFactor: 1.5,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                  gridDelegate: Config.delegate,
                  itemCount: CategoryModel.listCategory.length,
                  itemBuilder: (BuildContext ctx, index) {
                    CategoryModel item = CategoryModel.listCategory[index];
                    return BaseCard(
                      image: item.img.toString(),
                      text: item.description.toString(),
                      onTap: () {},
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
