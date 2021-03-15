import 'package:flutter_modular/flutter_modular.dart';

import 'bookmarks_controller.dart';
import 'bookmarks_page.dart';

class BookmarksModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $BookmarksController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => BookmarksPage()),
      ];

  static Inject get to => Inject<BookmarksModule>.of();
}
