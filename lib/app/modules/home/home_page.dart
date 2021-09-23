import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/auth/auth_store.dart';
import 'package:hurry/app/shared/controllers/event_controller.dart';
import 'package:hurry/app/shared/models/event_model.dart';
import 'package:hurry/app/shared/models/user_model.dart';
import 'package:hurry/app/src/bottom_appbar.dart';
import 'package:themes/themes.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  EventController eventController = Modular.get();
  AuthStore auth = Modular.get();
  @override
  Widget build(BuildContext context) {
    var sh = MediaQuery.of(context).size.height;
    // var sw = MediaQuery.of(context).size.width;
    store.getEvent();

    UserModel user = auth.loged == true ? auth.user : UserModel();
    if (user.id != 0) {
      store.getMEvent(user.id.toString());
    }
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
          text: user.id != null ? 'Bem vindo ${user.firstName}' : 'Bem Vindo',
          image: user.img ?? '',
          onTap: () {
            print('ok');
          },
        ),
        preferredSize: Size(
          double.maxFinite,
          sh * .2,
        ),
      ),
      body: Observer(
        builder: (context) => store.eventList.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Proximos eventos',
                                  style: AppTextStyle.primaryTitleStyle,
                                ),
                              ],
                            ),
                            Container(
                              height: sh * .2,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: store.eventList.length,
                                itemBuilder: (context, index) {
                                  EventModel event = store.eventList[index];
                                  return BaseCard(
                                    image: event.image,
                                    text: event.description,
                                    onTap: () {
                                      eventController.eventModel = event;
                                      Modular.to.pushNamed('/events');
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Indicados',
                                  style: AppTextStyle.primaryTitleStyle,
                                ),
                                ButtomText(
                                    onPressed: () {
                                      Modular.to.pushNamed('/home/view_more');
                                    },
                                    text: 'Ver Mais')
                              ],
                            ),
                            Container(
                              height: sh * .2,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: store.eventList.length,
                                itemBuilder: (context, index) {
                                  EventModel event = store.eventList[index];
                                  return BaseCard(
                                    image: event.image,
                                    text: event.description,
                                    onTap: () {
                                      eventController.eventModel = event;
                                      Modular.to.pushNamed('/events');
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      auth.loged != false
                          ? Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Meus Eventos',
                                        style: AppTextStyle.primaryTitleStyle,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: sh * .2,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: store.mEventList.length,
                                      itemBuilder: (context, index) {
                                        EventModel event = store.mEventList[index];
                                        return BaseCard(
                                          image: event.image,
                                          text: event.description,
                                          onTap: () {
                                            eventController.eventModel = event;
                                            Modular.to.pushNamed('/events/my/events');
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
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
