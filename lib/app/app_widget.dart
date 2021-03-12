import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/app/app_controller.dart';
import 'package:asuka/asuka.dart' as asuka;

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends ModularState<AppWidget, AppController> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return MaterialApp(
        builder: asuka.builder,
        debugShowCheckedModeBanner: false,
        navigatorKey: Modular.navigatorKey,
        title: 'Flutter News',
        theme: controller.themeStore.themeMode,
        initialRoute: '/',
        onGenerateRoute: Modular.generateRoute,
      );
    });
  }
}
