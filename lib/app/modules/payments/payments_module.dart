import 'package:hurry/app/modules/payments/pages/card/ticket/pre_payment_card_page.dart';
import 'package:hurry/app/modules/payments/payments_Page.dart';
import 'package:hurry/app/modules/payments/payments_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PaymentsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PaymentsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => PaymentsPage()),
    ChildRoute('/pre', child: (_, args) => PrePaymentCard()),
  ];
}
