// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$eventListAtom = Atom(name: 'HomeStoreBase.eventList');

  @override
  ObservableList<EventModel> get eventList {
    _$eventListAtom.reportRead();
    return super.eventList;
  }

  @override
  set eventList(ObservableList<EventModel> value) {
    _$eventListAtom.reportWrite(value, super.eventList, () {
      super.eventList = value;
    });
  }

  final _$mEventListAtom = Atom(name: 'HomeStoreBase.mEventList');

  @override
  ObservableList<EventModel> get mEventList {
    _$mEventListAtom.reportRead();
    return super.mEventList;
  }

  @override
  set mEventList(ObservableList<EventModel> value) {
    _$mEventListAtom.reportWrite(value, super.mEventList, () {
      super.mEventList = value;
    });
  }

  @override
  String toString() {
    return '''
eventList: ${eventList},
mEventList: ${mEventList}
    ''';
  }
}
