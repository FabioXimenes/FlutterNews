import 'package:flutter_news_app/app/shared/constants.dart';
import 'package:flutter_news_app/app/shared/services/interfaces/local_storage_interface.dart';
import 'package:flutter_news_app/app/shared/stores/bookmark_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'bookmark_controller.g.dart';

@Injectable(singleton: false)
class BookmarkController = _BookmarkControllerBase with _$BookmarkController;

abstract class _BookmarkControllerBase with Store {
  final ILocalStorage _localStorage = Modular.get();
  final BookmarkStore _bookmarkStore = Modular.get();

  @observable
  bool isBookmarked = false;

  @action
  checkArticleBookmark(String articleUrl) async {
    isBookmarked = _bookmarkStore.bookmarks.contains(articleUrl);
    print('Check bookmark: $isBookmarked');
  }

  @action
  setBookmark(String articleUrl) async {
    _bookmarkStore.addBookmark(articleUrl);
    isBookmarked = true;
  }

  @action
  removeBookmark(String articleUrl) async {
    _bookmarkStore.removeBookmark(articleUrl);
    isBookmarked = false;
  }
}
