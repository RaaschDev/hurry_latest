import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/payments/payments_store.dart';
import 'package:flutter/material.dart';
import 'package:hurry/app/modules/payments/widgets/header.dart';
import 'package:hurry/app/modules/payments/widgets/quant_input.dart';
import 'package:hurry/app/modules/payments/widgets/ticket_card.dart';
import 'package:hurry/app/shared/controllers/event_controller.dart';
import 'package:hurry/app/shared/models/event_model.dart';
import 'package:hurry/app/shared/models/ticket_model.dart';
import 'package:themes/themes.dart';

class PaymentsPage extends StatefulWidget {
  final String title;
  const PaymentsPage({Key? key, this.title = 'PaymentsPage'}) : super(key: key);
  @override
  PaymentsPageState createState() => PaymentsPageState();
}

class PaymentsPageState extends State<PaymentsPage> {
  final PaymentsStore store = Modular.get();
  EventController eventController = Modular.get();

  @override
  Widget build(BuildContext context) {
    var sh = MediaQuery.of(context).size.height;
    var sw = MediaQuery.of(context).size.width;
    EventModel event = eventController.eventModel!;
    store.getArtist(event.id);
    store.qnt = 1;
    store.calc(store.ticketList.first);

    return Scaffold(
        appBar: AppBar(),
        body: Observer(
          builder: (context) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  HeaderWidget(
                      description: event.description,
                      date: event.date,
                      start: event.start,
                      end: event.end,
                      city: event.city,
                      complement: event.complement),
                  Container(
                    height: sh * .25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Categorias de ingressos',
                          style: AppTextStyle.primaryTitleStyle,
                        ),
                        Container(
                          height: sh * .16,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: store.ticketList.length,
                            itemBuilder: (context, index) {
                              TicketModel ticket = store.ticketList[index];
                              return TicketCard(
                                text: '${ticket.description}',
                                value: '${ticket.price}',
                                onTap: () {
                                  store.calc(ticket);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 120,
                    child: Row(
                      children: [
                        Expanded(
                            child: Center(
                          child: TicketCard(
                            onTap: () {
                              store.m = true;
                              store.calc(store.ticket);
                            },
                            text: 'Meia',
                            value: '${store.pricem.toString()}',
                          ),
                        )),
                        Expanded(
                            child: Center(
                          child: TicketCard(
                            onTap: () {
                              store.m = false;
                              store.calc(store.ticket);
                            },
                            text: 'Inteira',
                            value: '${store.price.toString()}',
                          ),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  QuantInput(
                    value: '${store.value.toString()}',
                    qnt: '${store.qnt}',
                    max: () {
                      if (store.qnt! >= 2) {
                        store.qnt = store.qnt! - 1;
                        store.sub();
                      }
                    },
                    min: () {
                      store.qnt = store.qnt! + 1;
                      store.sum();
                    },
                  ),
                  PrimaryButton(
                      onPressed: () {
                        Modular.to.pushNamed('/payments/pre');
                      },
                      text: 'Comprar')
                ],
              ),
            ),
          ),
        ));
  }
}
