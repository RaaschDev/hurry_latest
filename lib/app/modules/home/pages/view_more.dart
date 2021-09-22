import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/home/home_store.dart';
import 'package:hurry/app/shared/models/event_model.dart';
import 'package:hurry/app/src/bottom_appbar.dart';
import 'package:themes/themes.dart';

class ViewMore extends StatelessWidget {
  HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todos os Eventos',
          style: AppTextStyle.primaryTitleStyle,
        ),
      ),
      body: Observer(
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView.builder(
            itemCount: store.eventList.length,
            itemBuilder: (context, index) {
              EventModel event = store.eventList[index];
              return BaseCard(
                image: event.image,
                text: event.description,
                onTap: () {},
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        on1: () {},
        on2: () {},
        on3: () {
          Modular.to.pushNamed('/auth');
        },
      ),
    );
  }
}
