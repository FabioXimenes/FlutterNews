import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'search_controller.g.dart';

@Injectable()
class SearchController = _SearchControllerBase with _$SearchController;

abstract class _SearchControllerBase with Store {
  final searchFieldController = TextEditingController();

  @observable
  String searchQuery = '';

  @computed
  bool get isSearchQueryEmpty => searchQuery != '';

  @action
  void setSearchQuery(value) => searchQuery = value;

  @action
  clearSearchQuery() {
    searchFieldController.clear();
    searchQuery = '';
  }
}
