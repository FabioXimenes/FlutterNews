import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/styles/themes.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'theme_store.g.dart';

@Injectable()
class ThemeStore = _ThemeStoreBase with _$ThemeStore;

abstract class _ThemeStoreBase with Store {
  @observable
  ThemeData themeMode = AppTheme.lightTheme;

  @computed
  bool get isDark => themeMode.brightness == Brightness.dark;

  @action
  changeTheme() =>
      themeMode = isDark ? AppTheme.lightTheme : AppTheme.darkTheme;
}
