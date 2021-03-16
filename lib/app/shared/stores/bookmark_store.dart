import 'package:flutter/foundation.dart';
import '../constants/local_storage_keys.dart';
import '../services/interfaces/local_storage_interface.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'bookmark_store.g.dart';

@Injectable()
class BookmarkStore = _BookmarkStoreBase with _$BookmarkStore;

abstract class _BookmarkStoreBase with Store {
  final ILocalStorage _localStorage = Modular.get();
  ValueNotifier bookmarksLength;

  @observable
  ObservableList<Map<String, dynamic>> bookmarks =
      <Map<String, dynamic>>[].asObservable();

  _BookmarkStoreBase() {
    bookmarksLength = ValueNotifier(bookmarks);
  }

  @action
  getBookmarks() async {
    if (await _localStorage.contains(AppLocalStorageKeys.bookmarks)) {
      bookmarks = List<Map<String, dynamic>>.from(
              await _localStorage.getValue<Map>(AppLocalStorageKeys.bookmarks))
          .asObservable();
    }
  }

  @action
  addBookmark(Map<String, dynamic> bookmark) async {
    bookmarks.add(bookmark);
    await _localStorage.setValue<Map>(AppLocalStorageKeys.bookmarks, bookmarks);
    bookmarksLength.notifyListeners();
  }

  @action
  removeBookmark(Map<String, dynamic> bookmark) async {
    bookmarks.removeWhere((element) => element['url'] == bookmark['url']);
    await _localStorage.setValue<Map>(AppLocalStorageKeys.bookmarks, bookmarks);
    bookmarksLength.notifyListeners();
  }
}
