// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SettingsController = BindInject(
  (i) => SettingsController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsController on _SettingsControllerBase, Store {
  final _$signInMethodAtom = Atom(name: '_SettingsControllerBase.signInMethod');

  @override
  String get signInMethod {
    _$signInMethodAtom.reportRead();
    return super.signInMethod;
  }

  @override
  set signInMethod(String value) {
    _$signInMethodAtom.reportWrite(value, super.signInMethod, () {
      super.signInMethod = value;
    });
  }

  final _$getSignInMethodAsyncAction =
      AsyncAction('_SettingsControllerBase.getSignInMethod');

  @override
  Future getSignInMethod() {
    return _$getSignInMethodAsyncAction.run(() => super.getSignInMethod());
  }

  @override
  String toString() {
    return '''
signInMethod: ${signInMethod}
    ''';
  }
}
