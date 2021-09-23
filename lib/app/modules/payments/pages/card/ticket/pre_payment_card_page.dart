import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/auth/auth_store.dart';
import 'package:hurry/app/modules/payments/widgets/header.dart';
import 'package:hurry/app/modules/payments/widgets/payment.dart';
import 'package:hurry/app/shared/controllers/event_controller.dart';
import 'package:hurry/app/shared/models/event_model.dart';

import '../../../payments_store.dart';

class PrePaymentCard extends StatefulWidget {
  const PrePaymentCard({Key? key}) : super(key: key);

  @override
  _PrePaymentCardState createState() => _PrePaymentCardState();
}

class _PrePaymentCardState extends State<PrePaymentCard> {
  final AuthStore auth = Modular.get();
  final PaymentsStore store = Modular.get();
  EventController eventController = Modular.get();
  @override
  Widget build(BuildContext context) {
    EventModel event = eventController.eventModel!;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Observer(
          builder: (context) => Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: HeaderWidget(
                  description: event.description,
                  value: store.value.toString(),
                ),
              ),
              CardPage(
                motivo: 'sale_ticket',
                reference: 'ex-001',
                value: store.value.toInt(),
                tId: store.ticket.id,
                tType: store.m == true ? 'half' : 'full',
                tQuantity: store.qnt,
                wallet: 1,
                user: auth.user.id,
                eventId: eventController.eventModel?.id,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// 4-111-111-111-111-111