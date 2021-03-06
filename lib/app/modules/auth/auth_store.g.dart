// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  final _$authAtom = Atom(name: '_AuthStoreBase.auth');

  @override
  AuthModel get auth {
    _$authAtom.reportRead();
    return super.auth;
  }

  @override
  set auth(AuthModel value) {
    _$authAtom.reportWrite(value, super.auth, () {
      super.auth = value;
    });
  }

  final _$userAtom = Atom(name: '_AuthStoreBase.user');

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$logedAtom = Atom(name: '_AuthStoreBase.loged');

  @override
  bool get loged {
    _$logedAtom.reportRead();
    return super.loged;
  }

  @override
  set loged(bool value) {
    _$logedAtom.reportWrite(value, super.loged, () {
      super.loged = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_AuthStoreBase.login');

  @override
  Future<void> login(dynamic password, dynamic email) {
    return _$loginAsyncAction.run(() => super.login(password, email));
  }

  @override
  String toString() {
    return '''
auth: ${auth},
user: ${user},
loged: ${loged}
    ''';
  }
}
