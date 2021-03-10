import 'settings_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'settings_page.dart';

class SettingsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $SettingsController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SettingsPage()),
      ];

  static Inject get to => Inject<SettingsModule>.of();
}
