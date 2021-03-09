import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/app/styles/themes.dart';
import 'package:asuka/asuka.dart' as asuka;

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: asuka.builder,
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter News App',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
