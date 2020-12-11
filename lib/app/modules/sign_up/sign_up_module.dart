import 'sign_up_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'sign_up_page.dart';

class SignUpModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $SignUpController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SignUpPage()),
      ];

  static Inject get to => Inject<SignUpModule>.of();
}
