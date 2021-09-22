import 'package:hurry/app/shared/models/artist_model.dart';
import 'package:hurry/app/shared/models/consumable_model.dart';
import 'package:hurry/app/shared/repositories/artist_repository.dart';
import 'package:hurry/app/shared/repositories/consumable_repository.dart';
import 'package:mobx/mobx.dart';

part 'events_store.g.dart';

class EventsStore = _EventsStoreBase with _$EventsStore;

abstract class _EventsStoreBase with Store {
  @observable
  ObservableList<ArtistModel> artistList = <ArtistModel>[].asObservable();

  Future<void> getArtist(id) async {
    List<ArtistModel> artistaList = await ArtistRepository().getArtist(id);
    artistList.clear();
    artistaList.forEach((element) {
      artistList.add(element);
    });
    print(artistList.first.description);
  }

  @observable
  ObservableList<ConsumableModel> consumableList = <ConsumableModel>[].asObservable();

  Future<void> getConsumable(id) async {
    List<ConsumableModel> artistaLista = await ConsumableRepository().getConsumable(id);
    consumableList.clear();
    artistaLista.forEach((element) {
      consumableList.add(element);
    });
    print(artistList.first.description);
  }
}
