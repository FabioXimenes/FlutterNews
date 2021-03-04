import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_news_app/app/shared/models/articles_response_model.dart';
import 'package:flutter_news_app/app/shared/models/query_model.dart';
import 'package:flutter_news_app/app/shared/repositories/article_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'search_controller.g.dart';

@Injectable()
class SearchController = _SearchControllerBase with _$SearchController;

enum LoadingStatus {
  waiting,
  loading,
  success,
}

abstract class _SearchControllerBase with Store {
  final ArticleRepository _articleRepository = Modular.get();

  final searchFieldController = TextEditingController();
  final fromDateController = MaskedTextController(mask: '00/00/0000');
  final toDateController = MaskedTextController(mask: '00/00/0000');

  final List<String> sortOptions = ['publishedAt', 'relevancy', 'popularity'];

  @observable
  String searchQuery = '';

  @observable
  bool isFiltering = false;

  @observable
  String sortBy = 'publishedAt';

  @observable
  LoadingStatus loadingStatus = LoadingStatus.waiting;

  @observable
  ArticlesResponseModel articlesResponse;

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

  @action
  search() async {
    if (searchQuery != '') {
      isFiltering = false;
      loadingStatus = LoadingStatus.loading;

      var query = QueryModel(
        message: searchQuery,
        sortBy: sortBy,
      );

      articlesResponse = await _articleRepository.getArticlesByFilter(query);
      articlesResponse.articles = articlesResponse.articles
          .where((element) => element.url != null)
          .toList();

      loadingStatus = LoadingStatus.success;
    } else {
      articlesResponse = null;
    }
  }
}
