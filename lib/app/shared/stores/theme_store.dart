import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/shared/constants.dart';
import 'package:flutter_news_app/app/shared/services/shared_preferences_service.dart';
import 'package:flutter_news_app/app/styles/themes.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'theme_store.g.dart';

@Injectable()
class ThemeStore = _ThemeStoreBase with _$ThemeStore;

abstract class _ThemeStoreBase with Store {
  final SharedPreferencesService _sharedPreferencesService = Modular.get();

  @observable
  ThemeData themeMode;

  _ThemeStoreBase() {
    loadTheme();
  }

  @computed
  bool get isDark => themeMode.brightness == Brightness.dark;

  @action
  Future<void> changeTheme() async {
    themeMode = isDark ? AppTheme.lightTheme : AppTheme.darkTheme;
    await saveThemePreferences();
  }

  Future<void> saveThemePreferences() async {
    await _sharedPreferencesService.setValue<bool>(
        AppStorage.themeMode, isDark);
  }

  Future<void> loadTheme() async {
    var _isDark =
        await _sharedPreferencesService.getValue<bool>(AppStorage.themeMode);

    themeMode = _isDark ? AppTheme.darkTheme : AppTheme.lightTheme;
  }
}
