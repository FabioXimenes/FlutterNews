import 'trending_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'trending_page.dart';

class TrendingModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $TrendingController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => TrendingPage()),
      ];

  static Inject get to => Inject<TrendingModule>.of();
}
