import 'search_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'search_page.dart';

class SearchModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $SearchController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SearchPage()),
      ];

  static Inject get to => Inject<SearchModule>.of();
}
