// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventsStore on _EventsStoreBase, Store {
  final _$artistListAtom = Atom(name: '_EventsStoreBase.artistList');

  @override
  ObservableList<ArtistModel> get artistList {
    _$artistListAtom.reportRead();
    return super.artistList;
  }

  @override
  set artistList(ObservableList<ArtistModel> value) {
    _$artistListAtom.reportWrite(value, super.artistList, () {
      super.artistList = value;
    });
  }

  final _$consumableListAtom = Atom(name: '_EventsStoreBase.consumableList');

  @override
  ObservableList<ConsumableModel> get consumableList {
    _$consumableListAtom.reportRead();
    return super.consumableList;
  }

  @override
  set consumableList(ObservableList<ConsumableModel> value) {
    _$consumableListAtom.reportWrite(value, super.consumableList, () {
      super.consumableList = value;
    });
  }

  @override
  String toString() {
    return '''
artistList: ${artistList},
consumableList: ${consumableList}
    ''';
  }
}
