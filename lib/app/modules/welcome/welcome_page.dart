import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/welcome/pages/page1.dart';
import 'package:hurry/app/modules/welcome/pages/page2.dart';
import 'package:hurry/app/modules/welcome/pages/page3.dart';
import 'package:hurry/app/modules/welcome/pages/page4.dart';
import 'package:hurry/app/modules/welcome/pages/page5.dart';
import 'package:hurry/app/modules/welcome/welcome_store.dart';
import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

class WelcomePage extends StatefulWidget {
  final String title;
  const WelcomePage({Key? key, this.title = 'WelcomePage'}) : super(key: key);
  @override
  WelcomePageState createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  final WelcomeStore store = Modular.get();
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var sh = MediaQuery.of(context).size.height;
    // var sw = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Observer(
      builder: (context) => Container(
        height: sh,
        child: Stack(
          children: [
            PageView(
              onPageChanged: (page) {
                store.setPage(page);
                print(page);
              },
              controller: pageController,
              children: [
                Page1(),
                Page2(),
                Page3(),
                Page4(),
                Page5(),
              ],
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Container(
                height: sh * .1,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    store.currentPage != 0 && store.currentPage != 4
                        ? RoundedButton(
                            onPressed: () {
                              int page = store.currentPage - 1;
                              pageController.animateToPage(page, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                            },
                            color: AppColors.whiteColor,
                            size: 25.0,
                            icon: Icons.arrow_back_ios_outlined,
                          )
                        : SizedBox(),
                    Expanded(
                        child: store.currentPage == 4
                            ? Container(
                                child: PrimaryButton(
                                onPressed: () {
                                  Modular.to.pushReplacementNamed('/home');
                                },
                                text: 'Entrar',
                              ))
                            : SizedBox()),
                    store.currentPage != 4
                        ? RoundedButton(
                            onPressed: () {
                              int page = store.currentPage + 1;
                              pageController.animateToPage(page, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                            },
                            color: AppColors.whiteColor,
                            size: 25.0,
                            icon: Icons.arrow_forward_ios_outlined,
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
