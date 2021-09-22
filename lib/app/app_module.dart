import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/auth/auth_module.dart';
import 'package:hurry/app/modules/auth/auth_store.dart';
import 'package:hurry/app/modules/events/events_module.dart';
import 'package:hurry/app/modules/payments/payments_module.dart';
import 'package:hurry/app/modules/perfil/perfil_module.dart';
import 'package:hurry/app/shared/controllers/event_controller.dart';

import 'modules/home/home_module.dart';
import 'modules/welcome/welcome_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore()),
    Bind.lazySingleton((i) => EventController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: WelcomeModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/events', module: EventsModule()),
    ModuleRoute('/auth', module: AuthModule()),
    ModuleRoute('/payments', module: PaymentsModule()),
    ModuleRoute('/perfil', module: PerfilModule()),
  ];
}
