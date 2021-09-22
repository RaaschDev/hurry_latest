class TicketModel {
  TicketModel({
    this.id,
    this.description,
    this.batch,
    this.price,
  });
  int? id;
  String? description;
  String? batch;
  String? price;

  TicketModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    batch = json['batch'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['description'] = description;
    _data['batch'] = batch;
    _data['price'] = price;
    return _data;
  }
}
