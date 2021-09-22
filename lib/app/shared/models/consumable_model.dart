class ConsumableModel {
  ConsumableModel({
    required this.id,
    required this.description,
    required this.consumableType,
    required this.price,
    required this.img,
  });
  late final int id;
  late final String description;
  late final String consumableType;
  late final String price;
  late final String img;

  ConsumableModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    consumableType = json['consumable_type'];
    price = json['price'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['description'] = description;
    _data['consumable_type'] = consumableType;
    _data['price'] = price;
    _data['img'] = img;
    return _data;
  }
}
