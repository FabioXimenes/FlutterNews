import 'package:flutter_news_app/app/shared/constants.dart';
import 'package:flutter_news_app/app/shared/services/interfaces/local_storage_interface.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'bookmark_store.g.dart';

@Injectable()
class BookmarkStore = _BookmarkStoreBase with _$BookmarkStore;

abstract class _BookmarkStoreBase with Store {
  final ILocalStorage _localStorage = Modular.get();

  @observable
  ObservableList<String> bookmarks = <String>[].asObservable();

  @action
  getBookmarks() async {
    if (await _localStorage.contains(AppStorage.bookmarks)) {
      bookmarks = List<String>.from(
          await _localStorage.getValue<List>(AppStorage.bookmarks)).asObservable();
    }
  }

  @action
  addBookmark(String bookmark) async {
    bookmarks.add(bookmark);
    await _localStorage.setValue<List>(AppStorage.bookmarks, bookmarks);
  }

  @action
  removeBookmark(String bookmark) async {
    bookmarks.remove(bookmark);
    await _localStorage.setValue<List>(AppStorage.bookmarks, bookmarks);
  }
}
