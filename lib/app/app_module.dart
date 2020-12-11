import 'package:flutter_news_app/app/modules/login/login_module.dart';
import 'package:flutter_news_app/app/modules/sign_up/sign_up_module.dart';
import 'package:flutter_news_app/app/modules/start/start_module.dart';
import 'package:flutter_news_app/app/modules/start/submodules/trending/trending_module.dart';
import 'package:flutter_news_app/app/shared/constants.dart';
import 'package:flutter_news_app/app/shared/http/custom_dio.dart';
import 'package:flutter_news_app/app/shared/repositories/article_repository.dart';
import 'package:flutter_news_app/app/shared/repositories/user_repository.dart';
import 'package:flutter_news_app/app/shared/services/user_firebase_auth.dart';
import 'package:flutter_news_app/app/splash/splash_page.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
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
