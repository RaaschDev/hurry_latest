import 'package:hurry/app/modules/auth/pages/register/register_store.dart';
import 'package:hurry/app/modules/perfil/page/perfil_page.dart';
import 'package:hurry/app/modules/perfil/perfil_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PerfilModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PerfilStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => PerfilPage()),
  ];
}
