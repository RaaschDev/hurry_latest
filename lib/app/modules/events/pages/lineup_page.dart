import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/events/events_store.dart';
import 'package:hurry/app/shared/controllers/event_controller.dart';
import 'package:hurry/app/shared/models/artist_model.dart';
import 'package:hurry/app/shared/models/event_model.dart';
import 'package:themes/themes.dart';

class LineUpPage extends StatelessWidget {
  EventsStore store = Modular.get();
  EventController eventController = Modular.get();

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView.builder(
          itemCount: store.artistList.length,
          itemBuilder: (context, index) {
            ArtistModel artist = store.artistList[index];
            return BaseCard(image: artist.img, text: artist.description, onTap: () {});
          },
        ),
      ),
    );
  }
}
