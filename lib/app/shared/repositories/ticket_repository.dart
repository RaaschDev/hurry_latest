import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:hurry/app/shared/models/artist_model.dart';
import 'package:hurry/app/shared/models/consumable_model.dart';
import 'package:hurry/app/shared/models/ticket_model.dart';
import 'package:hurry/app/src/constants.dart';

class TicketRepository {
  Future<List<TicketModel>> getTicket(id) async {
    var response = await http.get(Constants.ticketUrl(id));
    List<TicketModel> ticketList = <TicketModel>[];
    try {
      if (response.statusCode == 200) {
        print(response.statusCode);
        var dec = json.decode(response.body)['results'] as List;
        print(dec.length);
        dec.forEach((element) {
          ticketList.add(TicketModel.fromJson(element));
        });
      }
    } catch (e) {
      print(e);
    }
    return ticketList;
  }
}
