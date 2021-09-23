import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/auth/auth_store.dart';
import 'package:hurry/app/modules/events/events_store.dart';
import 'package:flutter/material.dart';
import 'package:hurry/app/shared/controllers/event_controller.dart';
import 'package:hurry/app/shared/models/event_model.dart';
import 'package:themes/themes.dart';

class MyEventPage extends StatelessWidget {
  final EventsStore store = Modular.get();
  final EventController eventController = Modular.get();
  final AuthStore auth = Modular.get();

  @override
  Widget build(BuildContext context) {
    var sh = MediaQuery.of(context).size.height;
    // var sw = MediaQuery.of(context).size.width;
    EventModel event = eventController.eventModel!;
    store.getArtist(event.id);
    return Observer(
      builder: (context) => Scaffold(
        body: Container(
          height: sh,
          child: Stack(
            children: [
              Container(
                height: sh * .4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      event.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              AppBar(),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: sh * .7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.backGroundColor,
                  ),
                  child: Container(
                    height: sh * .3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          event.description,
                          style: AppTextStyle.primaryTitleStyle,
                          textScaleFactor: 1.5,
                        ),
                        Text(
                          '${event.date} - ${event.start} ate ${event.end}',
                          style: AppTextStyle.accentButtonTextStyle,
                          textScaleFactor: 1,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          height: sh * .4,
                          child: Column(
                            children: [
                              BorderButton(
                                onPressed: () async {
                                  await store.getArtist(event.id);
                                  Modular.to.pushNamed('/events/line_up');
                                },
                                text: 'LINE UP',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              BorderButton(
                                text: 'CARDAPIO',
                                onPressed: () async {
                                  await store.getConsumable(event.id);
                                  Modular.to.pushNamed('/events/consumables');
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              BorderButton(
                                text: 'Endereco',
                                onPressed: () {},
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              BorderButton(
                                text: 'Carteira',
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        PrimaryButton(
                            onPressed: () {
                              print(auth.loged);
                              auth.loged == true ? Modular.to.pushNamed('/payments') : Modular.to.pushNamed('/auth');
                            },
                            text: 'Comprar'),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
