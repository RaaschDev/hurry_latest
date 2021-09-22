import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/shared/controllers/event_controller.dart';
import 'package:hurry/app/shared/models/consumable_model.dart';
import 'package:hurry/app/shared/models/event_model.dart';
import 'package:themes/theme/app_text.dart';
import 'package:themes/themes.dart';

import '../events_store.dart';

class ConsumablePage extends StatelessWidget {
  final EventsStore store = Modular.get();
  final EventController eventController = Modular.get();
  PageController pageController = PageController();
  void toPage(page) {
    pageController.animateToPage(page, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    EventModel event = eventController.eventModel!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          event.description,
          style: AppTextStyle.primaryTitleStyle,
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtomText(
                onPressed: () {
                  toPage(0);
                },
                text: 'Drinks',
              ),
              ButtomText(
                onPressed: () {
                  toPage(1);
                },
                text: 'Foods',
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: PageView(
                controller: pageController,
                children: [
                  Container(
                    child: ListView.builder(
                      itemCount: store.consumableList.length,
                      itemBuilder: (context, index) {
                        ConsumableModel consumable = store.consumableList[index];
                        if (consumable.consumableType != 'drink') {
                          return SizedBox();
                        } else {
                          return ConsumableCard(
                            text: consumable.description,
                            image: consumable.img,
                            price: 'R\$ ${consumable.price}',
                            stock: '23',
                          );
                        }
                      },
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      itemCount: store.consumableList.length,
                      itemBuilder: (context, index) {
                        ConsumableModel consumable = store.consumableList[index];
                        if (consumable.consumableType == 'drink') {
                          return SizedBox();
                        } else {
                          return ConsumableCard(
                            text: consumable.description,
                            image: consumable.img,
                            price: 'R\$ ${consumable.price}',
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
