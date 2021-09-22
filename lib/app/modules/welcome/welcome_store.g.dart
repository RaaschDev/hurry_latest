// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WelcomeStore on _WelcomeStoreBase, Store {
  final _$currentPageAtom = Atom(name: '_WelcomeStoreBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$_WelcomeStoreBaseActionController =
      ActionController(name: '_WelcomeStoreBase');

  @override
  void setPage(dynamic page) {
    final _$actionInfo = _$_WelcomeStoreBaseActionController.startAction(
        name: '_WelcomeStoreBase.setPage');
    try {
      return super.setPage(page);
    } finally {
      _$_WelcomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage}
    ''';
  }
}
