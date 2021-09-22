import 'package:hurry/app/modules/auth/auth_Page.dart';
import 'package:hurry/app/modules/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AuthPage()),
  ];
}
