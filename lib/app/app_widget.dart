import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/app/styles/themes.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter News App',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
