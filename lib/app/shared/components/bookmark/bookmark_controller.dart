import 'package:flutter_news_app/app/shared/services/interfaces/local_storage_interface.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'bookmark_controller.g.dart';

@Injectable(singleton: false)
class BookmarkController = _BookmarkControllerBase with _$BookmarkController;

abstract class _BookmarkControllerBase with Store {
  final ILocalStorage _localStorage = Modular.get();

  @observable
  bool isBookmarked = false;

  @action
  checkArticleBookmark(String articleUrl) async {
    isBookmarked = await _localStorage.contains(articleUrl);
    print('Check bookmark: $isBookmarked');
  }

  @action
  setBookmark(String articleUrl) async {
    await _localStorage.setValue(articleUrl, 'article');
    isBookmarked = true;
  }

  @action
  removeBookmark(String articleUrl) async {
    await _localStorage.delete(articleUrl);
    isBookmarked = false;
  }
}
