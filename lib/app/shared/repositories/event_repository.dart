import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:hurry/app/shared/models/event_model.dart';
import 'package:hurry/app/src/constants.dart';

class EventRepository {
  Future<List<EventModel>> getEvent() async {
    var response = await http.get(Constants.eventUrl);
    List<EventModel> eventList = <EventModel>[];
    try {
      if (response.statusCode == 200) {
        print(response.statusCode);
        var dec = json.decode(response.body)['results'] as List;
        dec.forEach((element) {
          eventList.add(EventModel.fromJson(element));
        });
      }
    } catch (e) {
      print(e);
    }
    return eventList;
  }

  Future<List<EventModel>> getMEvent(id) async {
    var response = await http.get(Constants.mEventUrl(id));
    List<EventModel> eventList = <EventModel>[];
    try {
      if (response.statusCode == 200) {
        print(response.statusCode);
        var dec = json.decode(response.body)['results'] as List;
        dec.forEach((element) {
          eventList.add(EventModel.fromJson(element['event']));
        });
      }
    } catch (e) {
      print(e);
    }
    return eventList;
  }
}
