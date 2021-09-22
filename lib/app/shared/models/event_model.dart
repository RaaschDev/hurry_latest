class EventModel {
  EventModel({
    required this.id,
    required this.description,
    required this.email,
    required this.date,
    required this.start,
    required this.end,
    required this.eventType,
    required this.category,
    required this.image,
    required this.advertsing,
    required this.street,
    required this.number,
    required this.complement,
    required this.district,
    required this.city,
    required this.state,
    required this.zip,
  });
  late final int id;
  late final String description;
  late final String email;
  late final String date;
  late final String start;
  late final String end;
  late final int eventType;
  late final int category;
  late final String image;
  late final String advertsing;
  late final String street;
  late final int number;
  late final String complement;
  late final String district;
  late final String city;
  late final String state;
  late final String zip;

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    email = json['email'];
    date = json['date'];
    start = json['start'];
    end = json['end'];
    eventType = json['event_type'];
    category = json['category'];
    image = json['image'];
    advertsing = json['advertsing'];
    street = json['street'];
    number = json['number'];
    complement = json['complement'];
    district = json['district'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['description'] = description;
    _data['email'] = email;
    _data['date'] = date;
    _data['start'] = start;
    _data['end'] = end;
    _data['event_type'] = eventType;
    _data['category'] = category;
    _data['image'] = image;
    _data['advertsing'] = advertsing;
    _data['street'] = street;
    _data['number'] = number;
    _data['complement'] = complement;
    _data['district'] = district;
    _data['city'] = city;
    _data['state'] = state;
    _data['zip'] = zip;
    return _data;
  }
}
