// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ThemeStore = BindInject(
  (i) => ThemeStore(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeStore on _ThemeStoreBase, Store {
  Computed<bool> _$isDarkComputed;

  @override
  bool get isDark => (_$isDarkComputed ??=
          Computed<bool>(() => super.isDark, name: '_ThemeStoreBase.isDark'))
      .value;

  final _$themeModeAtom = Atom(name: '_ThemeStoreBase.themeMode');

  @override
  ThemeData get themeMode {
    _$themeModeAtom.reportRead();
    return super.themeMode;
  }

  @override
  set themeMode(ThemeData value) {
    _$themeModeAtom.reportWrite(value, super.themeMode, () {
      super.themeMode = value;
    });
  }

  final _$changeThemeAsyncAction = AsyncAction('_ThemeStoreBase.changeTheme');

  @override
  Future<void> changeTheme() {
    return _$changeThemeAsyncAction.run(() => super.changeTheme());
  }

  @override
  String toString() {
    return '''
themeMode: ${themeMode},
isDark: ${isDark}
    ''';
  }
}
