import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'search_controller.g.dart';

@Injectable()
class SearchController = _SearchControllerBase with _$SearchController;

abstract class _SearchControllerBase with Store {
  final searchFieldController = TextEditingController();
  final List<String> sortOptions = ['relevancy', 'popularity', 'publishedAt'];

  @observable
  String searchQuery = '';

  @observable
  bool isFiltering = false;

  @observable
  String sortBy = '';

  @computed
  bool get isSearchQueryEmpty => searchQuery != '';

  @action
  void setSearchQuery(value) => searchQuery = value;

  @action
  void clearSearchQuery() {
    searchFieldController.clear();
    searchQuery = '';
  }

  @action
  void setFilteringFlag() => isFiltering = !isFiltering;

  @action
  void setSortOption(String value) => sortBy = value;
}
