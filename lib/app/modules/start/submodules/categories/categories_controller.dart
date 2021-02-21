import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/shared/constants/categories.dart';
import 'package:flutter_news_app/app/shared/models/articles_response_model.dart';
import 'package:flutter_news_app/app/shared/repositories/article_repository.dart';
import 'package:flutter_news_app/app/shared/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'categories_controller.g.dart';

@Injectable()
class CategoriesController = _CategoriesControllerBase
    with _$CategoriesController;

abstract class _CategoriesControllerBase with Store {
  final ArticleRepository _articleRepository = Modular.get();

  final List<Tab> tabs = [
    Tab(text: 'Business'),
    Tab(text: 'Entertainment'),
    Tab(text: 'General'),
    Tab(text: 'Health'),
    Tab(text: 'Science'),
    Tab(text: 'Sports'),
    Tab(text: 'Technology'),
  ];

  TabController tabController;

  @observable
  ArticlesResponseModel currentArticlesResponse;

  @observable
  int currentIndex = 0;

  @observable
  bool isLoading = false;

  @action
  getArticlesFromCategory(int categoryIndex) async {
    isLoading = true;
    currentIndex = categoryIndex;

    var result = await _articleRepository
        .getTopHeadlinesFromCategory(ARTICLE_CATEGORIES[categoryIndex]);
    result.articles =
        result.articles.where((e) => e.urlToImage != null).toList();

    currentArticlesResponse = result;

    isLoading = false;
  }
}
