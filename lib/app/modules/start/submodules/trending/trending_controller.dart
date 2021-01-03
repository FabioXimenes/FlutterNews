import 'package:flutter_news_app/app/shared/models/article_model.dart';
import 'package:flutter_news_app/app/shared/models/articles_response_model.dart';
import 'package:flutter_news_app/app/shared/repositories/article_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'trending_controller.g.dart';

@Injectable()
class TrendingController = _TrendingControllerBase with _$TrendingController;

abstract class _TrendingControllerBase with Store {
  final ArticleRepository articleRepository = Modular.get();

  @observable
  ArticlesResponseModel articlesResponse;

  @action
  getTopHeadlineArticles() async {
    articlesResponse = await articleRepository.getTopHeadlines();
    print(articlesResponse.articles[0].toJson().toString());
  }
}
