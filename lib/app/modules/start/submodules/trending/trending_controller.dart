import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/models/articles_response_model.dart';
import '../../../../shared/repositories/article_repository.dart';

part 'trending_controller.g.dart';

@Injectable()
class TrendingController = _TrendingControllerBase with _$TrendingController;

abstract class _TrendingControllerBase with Store {
  final ArticleRepository articleRepository = Modular.get();

  @observable
  ArticlesResponseModel articlesResponse;

  @action
  getTopHeadlineArticles() async {
    var result = await articleRepository.getTopHeadlines();
    result.articles = result.articles
        .where((e) => e.description != null && e.urlToImage != null)
        .toList();

    articlesResponse = result;
  }
}
