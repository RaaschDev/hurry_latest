class UserModel {
  UserModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.cpf,
    this.img,
  });
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? birthDate;
  String? cpf;
  String? img;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    birthDate = json['birth_date'];
    cpf = json['cpf'];
    img = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['birth_date'] = birthDate;
    _data['cpf'] = cpf;
    _data['img'] = img;
    return _data;
  }
}
