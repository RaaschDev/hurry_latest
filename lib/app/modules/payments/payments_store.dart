import 'package:hurry/app/shared/models/ticket_model.dart';
import 'package:hurry/app/shared/repositories/ticket_repository.dart';
import 'package:mobx/mobx.dart';

part 'payments_store.g.dart';

class PaymentsStore = _PaymentsStoreBase with _$PaymentsStore;

abstract class _PaymentsStoreBase with Store {
  @observable
  ObservableList<TicketModel> ticketList = <TicketModel>[].asObservable();
  @action
  Future<void> getArtist(id) async {
    List<TicketModel> tickList = await TicketRepository().getTicket(id);
    ticketList.clear();
    tickList.forEach((element) {
      ticketList.add(element);
    });
  }

  @observable
  TicketModel ticket = TicketModel();
  @observable
  double? price;

  @observable
  int? qnt;
  @observable
  bool m = false;
  @observable
  double? pricem;
  @observable
  double value = 0;
  @observable
  double? v;

  @action
  void calc(TicketModel t) {
    ticket = t;
    double? pri = double.tryParse(ticket.price!);
    price = pri;
    pricem = pri! / 2;
    if (m == false) {
      value = pri;
      v = pri;
    } else {
      value = pricem!;
      v = pricem;
    }
    qnt = 1;
  }

  void sum() {
    value = v! + value;
  }

  void sub() {
    value = value - v!;
  }
}
