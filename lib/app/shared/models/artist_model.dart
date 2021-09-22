class ArtistModel {
  ArtistModel({
    required this.id,
    required this.description,
    required this.spotfy,
    required this.start,
    required this.end,
    required this.img,
  });
  late final int id;
  late final String description;
  late final String spotfy;
  late final String start;
  late final String end;
  late final String img;

  ArtistModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    spotfy = json['spotfy'];
    start = json['start'];
    end = json['end'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['description'] = description;
    _data['spotfy'] = spotfy;
    _data['start'] = start;
    _data['end'] = end;
    _data['img'] = img;
    return _data;
  }
}
