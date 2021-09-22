import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:hurry/app/shared/models/artist_model.dart';
import 'package:hurry/app/shared/models/consumable_model.dart';
import 'package:hurry/app/src/constants.dart';

class ConsumableRepository {
  Future<List<ConsumableModel>> getConsumable(id) async {
    var response = await http.get(Constants.consumableUrl(id));
    List<ConsumableModel> consumableList = <ConsumableModel>[];
    try {
      if (response.statusCode == 200) {
        print(response.statusCode);
        var dec = json.decode(response.body)['results'] as List;
        dec.forEach((element) {
          consumableList.add(ConsumableModel.fromJson(element));
        });
      }
    } catch (e) {
      print(e);
    }
    return consumableList;
  }
}
