import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:hurry/app/shared/models/artist_model.dart';
import 'package:hurry/app/src/constants.dart';

class ArtistRepository {
  Future<List<ArtistModel>> getArtist(id) async {
    var response = await http.get(Constants.artistUrl(id));
    List<ArtistModel> artistList = <ArtistModel>[];
    try {
      if (response.statusCode == 200) {
        print(response.statusCode);
        var dec = json.decode(response.body)['results'] as List;
        dec.forEach((element) {
          artistList.add(ArtistModel.fromJson(element));
        });
      }
    } catch (e) {
      print(e);
    }
    return artistList;
  }
}
