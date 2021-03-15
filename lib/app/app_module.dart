import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/login/login_module.dart';
import 'modules/sign_up/sign_up_module.dart';
import 'modules/start/start_module.dart';
import 'modules/start/submodules/trending/trending_module.dart';
import 'shared/components/bookmark/bookmark_controller.dart';
import 'shared/components/password_text_field/password_text_field_controller.dart';
import 'shared/constants/routes.dart';
import 'shared/http/custom_dio.dart';
import 'shared/repositories/article_repository.dart';
import 'shared/repositories/user_repository.dart';
import 'shared/services/shared_preferences_service.dart';
import 'shared/services/user_firebase_auth.dart';
import 'shared/stores/bookmark_store.dart';
import 'shared/stores/query_store.dart';
import 'shared/stores/theme_store.dart';
import 'splash/splash_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $ThemeStore,
        $PasswordTextFieldController,
        $BookmarkStore,
        $BookmarkController,
        $QueryStore,
        $AppController,
        $SharedPreferencesService,
        Bind((i) => UserFirebaseAuth()),
        Bind((i) => UserRepository()),
        Bind((i) => ArticleRepository()),
        Bind((i) => CustomDio()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SplashPage()),
        ModularRouter(AppRoutes.login, module: LoginModule()),
        ModularRouter(AppRoutes.signUp, module: SignUpModule()),
        ModularRouter(AppRoutes.start, module: StartModule()),
        ModularRouter(AppRoutes.trending, module: TrendingModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
