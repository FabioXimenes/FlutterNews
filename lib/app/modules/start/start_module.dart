import 'package:flutter_news_app/app/shared/components/bookmark/bookmark_controller.dart';

import 'start_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'start_page.dart';

class StartModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $StartController,
        $BookmarkController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => StartPage()),
      ];

  static Inject get to => Inject<StartModule>.of();
}
