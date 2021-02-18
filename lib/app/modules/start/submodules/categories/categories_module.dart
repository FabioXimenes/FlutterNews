import 'categories_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'categories_page.dart';

class CategoriesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $CategoriesController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => CategoriesPage()),
      ];

  static Inject get to => Inject<CategoriesModule>.of();
}
