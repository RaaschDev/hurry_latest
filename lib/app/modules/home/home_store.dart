import 'package:hurry/app/shared/models/event_model.dart';
import 'package:hurry/app/shared/repositories/event_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  ObservableList<EventModel> eventList = <EventModel>[].asObservable();

  Future<void> getEvent() async {
    List<EventModel> eventoList = await EventRepository().getEvent();
    eventList.clear();
    eventoList.forEach((element) {
      eventList.add(element);
    });
  }
}
