import 'package:mobx/mobx.dart';

part 'welcome_store.g.dart';

class WelcomeStore = _WelcomeStoreBase with _$WelcomeStore;

abstract class _WelcomeStoreBase with Store {
  @observable
  int currentPage = 0;

  @action
  void setPage(page) {
    currentPage = page;
  }
}
