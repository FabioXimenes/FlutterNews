import 'package:flutter_news_app/app/shared/stores/bookmark_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'bookmarks_controller.g.dart';

@Injectable()
class BookmarksController = _BookmarksControllerBase with _$BookmarksController;

abstract class _BookmarksControllerBase with Store {
  final BookmarkStore bookmarkStore = Modular.get();
}
