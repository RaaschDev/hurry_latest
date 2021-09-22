// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentsStore on _PaymentsStoreBase, Store {
  final _$ticketListAtom = Atom(name: '_PaymentsStoreBase.ticketList');

  @override
  ObservableList<TicketModel> get ticketList {
    _$ticketListAtom.reportRead();
    return super.ticketList;
  }

  @override
  set ticketList(ObservableList<TicketModel> value) {
    _$ticketListAtom.reportWrite(value, super.ticketList, () {
      super.ticketList = value;
    });
  }

  final _$ticketAtom = Atom(name: '_PaymentsStoreBase.ticket');

  @override
  TicketModel get ticket {
    _$ticketAtom.reportRead();
    return super.ticket;
  }

  @override
  set ticket(TicketModel value) {
    _$ticketAtom.reportWrite(value, super.ticket, () {
      super.ticket = value;
    });
  }

  final _$priceAtom = Atom(name: '_PaymentsStoreBase.price');

  @override
  double? get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(double? value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  final _$qntAtom = Atom(name: '_PaymentsStoreBase.qnt');

  @override
  int? get qnt {
    _$qntAtom.reportRead();
    return super.qnt;
  }

  @override
  set qnt(int? value) {
    _$qntAtom.reportWrite(value, super.qnt, () {
      super.qnt = value;
    });
  }

  final _$mAtom = Atom(name: '_PaymentsStoreBase.m');

  @override
  bool get m {
    _$mAtom.reportRead();
    return super.m;
  }

  @override
  set m(bool value) {
    _$mAtom.reportWrite(value, super.m, () {
      super.m = value;
    });
  }

  final _$pricemAtom = Atom(name: '_PaymentsStoreBase.pricem');

  @override
  double? get pricem {
    _$pricemAtom.reportRead();
    return super.pricem;
  }

  @override
  set pricem(double? value) {
    _$pricemAtom.reportWrite(value, super.pricem, () {
      super.pricem = value;
    });
  }

  final _$valueAtom = Atom(name: '_PaymentsStoreBase.value');

  @override
  double get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(double value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$vAtom = Atom(name: '_PaymentsStoreBase.v');

  @override
  double? get v {
    _$vAtom.reportRead();
    return super.v;
  }

  @override
  set v(double? value) {
    _$vAtom.reportWrite(value, super.v, () {
      super.v = value;
    });
  }

  final _$getArtistAsyncAction = AsyncAction('_PaymentsStoreBase.getArtist');

  @override
  Future<void> getArtist(dynamic id) {
    return _$getArtistAsyncAction.run(() => super.getArtist(id));
  }

  final _$_PaymentsStoreBaseActionController =
      ActionController(name: '_PaymentsStoreBase');

  @override
  void calc(TicketModel t) {
    final _$actionInfo = _$_PaymentsStoreBaseActionController.startAction(
        name: '_PaymentsStoreBase.calc');
    try {
      return super.calc(t);
    } finally {
      _$_PaymentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ticketList: ${ticketList},
ticket: ${ticket},
price: ${price},
qnt: ${qnt},
m: ${m},
pricem: ${pricem},
value: ${value},
v: ${v}
    ''';
  }
}
