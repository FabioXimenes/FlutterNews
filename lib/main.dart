import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DotEnv.load();
  runApp(ModularApp(module: AppModule()));
}
