import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/models/articles_response_model.dart';
import '../../../../shared/models/query_model.dart';
import '../../../../shared/repositories/article_repository.dart';
import '../../../../shared/stores/query_store.dart';
import '../../../../shared/stores/theme_store.dart';

part 'search_controller.g.dart';

@Injectable()
class SearchController = _SearchControllerBase with _$SearchController;

enum LoadingStatus {
  waiting,
  loading,
  success,
}

abstract class _SearchControllerBase with Store implements Disposable {
  final ArticleRepository _articleRepository = Modular.get();
  final QueryStore _queryStore = Modular.get();
  final ThemeStore themeStore = Modular.get();

  final searchFieldController = TextEditingController();

  final List<String> sortOptions = ['publishedAt', 'relevancy', 'popularity'];

  @observable
  bool isFiltering = false;

  @observable
  String sortBy = 'publishedAt';

  @observable
  LoadingStatus loadingStatus = LoadingStatus.waiting;

  @observable
  ArticlesResponseModel articlesResponse;

  @computed
  bool get isSearchQueryEmpty => _queryStore.message != '';

  @action
  void setSearchQuery(value) => _queryStore.message = value;

  @action
  void clearSearchQuery() {
    searchFieldController.clear();
    _queryStore.message = '';
  }

  @action
  void setFilteringFlag() => isFiltering = !isFiltering;

  @action
  void setSortOption(String value) => sortBy = value;

  @action
  search() async {
    if (_queryStore.message != '') {
      isFiltering = false;
      loadingStatus = LoadingStatus.loading;

      var query = QueryModel(
        message: _queryStore.message,
        sortBy: sortBy,
        from: _queryStore.from.day == DateTime.now().day
            ? null
            : _queryStore.from.toIso8601String(),
        to: _queryStore.to.day == DateTime.now().day
            ? null
            : _queryStore.to.toIso8601String(),
      );

      articlesResponse = await _articleRepository.getArticlesByFilter(query);
      articlesResponse.articles = articlesResponse.articles
          .where((element) => element.urlToImage != null)
          .toList();

      loadingStatus = LoadingStatus.success;
    } else {
      loadingStatus = LoadingStatus.waiting;
      articlesResponse = null;
    }
  }

  @override
  void dispose() {
    searchFieldController.dispose();
  }
}
