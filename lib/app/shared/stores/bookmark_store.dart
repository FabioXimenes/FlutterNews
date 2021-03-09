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
  ObservableList<Map<String,dynamic>> bookmarks = <Map<String, dynamic>>[].asObservable();

  @action
  getBookmarks() async {
    if (await _localStorage.contains(AppStorage.bookmarks)) {
      bookmarks = List<Map<String, dynamic>>.from(
          await _localStorage.getValue<Map>(AppStorage.bookmarks)).asObservable();
    }
  }

  @action
  addBookmark(Map<String, dynamic> bookmark) async {
    bookmarks.add(bookmark);
    await _localStorage.setValue<Map>(AppStorage.bookmarks, bookmarks);
  }

  @action
  removeBookmark(Map<String, dynamic> bookmark) async {
    bookmarks.removeWhere((element) => element['url'] == bookmark['url']);
    await _localStorage.setValue<Map>(AppStorage.bookmarks, bookmarks);
  }
}
