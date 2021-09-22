import 'package:hurry/app/modules/welcome/welcome_Page.dart';
import 'package:hurry/app/modules/welcome/welcome_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WelcomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => WelcomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => WelcomePage()),
  ];
}
