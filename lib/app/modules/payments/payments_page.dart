import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/payments/payments_store.dart';
import 'package:flutter/material.dart';
import 'package:hurry/app/shared/controllers/event_controller.dart';
import 'package:hurry/app/shared/models/event_model.dart';
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
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Container(
                height: sh * .3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.description,
                      style: AppTextStyle.primaryTitleStyle,
                      textScaleFactor: 1.2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
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
                            '${event.date} - ${event.start} ate ${event.end}',
                            style: AppTextStyle.accentButtonTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
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
                            '${event.city} - ${event.complement}',
                            style: AppTextStyle.accentButtonTextStyle,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
