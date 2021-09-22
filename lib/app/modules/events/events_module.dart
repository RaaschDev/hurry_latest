import 'package:hurry/app/modules/events/events_Page.dart';
import 'package:hurry/app/modules/events/events_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/events/pages/carteira_page.dart';
import 'package:hurry/app/modules/events/pages/consumable_page.dart';
import 'package:hurry/app/modules/events/pages/lineup_page.dart';
import 'package:hurry/app/modules/events/pages/myEventPage.dart';

class EventsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => EventsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => EventsPage()),
    ChildRoute('/my/events', child: (_, args) => MyEventPage()),
    ChildRoute('/line_up', child: (_, args) => LineUpPage()),
    ChildRoute('/carteira', child: (_, args) => CarteiraPage()),
    ChildRoute('/consumables', child: (_, args) => ConsumablePage()),
  ];
}
