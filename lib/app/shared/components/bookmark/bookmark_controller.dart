import 'package:flutter_news_app/app/shared/constants.dart';
import 'package:flutter_news_app/app/shared/models/article_model.dart';
import 'package:flutter_news_app/app/shared/services/interfaces/local_storage_interface.dart';
import 'package:flutter_news_app/app/shared/stores/bookmark_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'bookmark_controller.g.dart';

@Injectable(singleton: false)
class BookmarkController = _BookmarkControllerBase with _$BookmarkController;

abstract class _BookmarkControllerBase with Store {
  final ILocalStorage _localStorage = Modular.get();
  final BookmarkStore bookmarkStore = Modular.get();

  @observable
  bool isBookmarked = false;

  @action
  checkArticleBookmark(ArticleModel article) async {
    var index = bookmarkStore.bookmarks.indexWhere((element) => element['url'] == article.url);
    isBookmarked = index != -1;
    print('Check bookmark: $isBookmarked');
  }

  @action
  setBookmark(ArticleModel article) async {
    bookmarkStore.addBookmark(article.toJson());
    isBookmarked = true;
  }

  @action
  removeBookmark(ArticleModel article) async {
    bookmarkStore.removeBookmark(article.toJson());
    isBookmarked = false;
  }
}
