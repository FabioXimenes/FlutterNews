// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_text_field_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PasswordTextFieldController = BindInject(
  (i) => PasswordTextFieldController(),
  singleton: false,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PasswordTextFieldController on _PasswordTextFieldControllerBase, Store {
  final _$showPasswordAtom =
      Atom(name: '_PasswordTextFieldControllerBase.showPassword');

  @override
  bool get showPassword {
    _$showPasswordAtom.reportRead();
    return super.showPassword;
  }

  @override
  set showPassword(bool value) {
    _$showPasswordAtom.reportWrite(value, super.showPassword, () {
      super.showPassword = value;
    });
  }

  final _$_PasswordTextFieldControllerBaseActionController =
      ActionController(name: '_PasswordTextFieldControllerBase');

  @override
  void changePasswordVisibility() {
    final _$actionInfo =
        _$_PasswordTextFieldControllerBaseActionController.startAction(
            name: '_PasswordTextFieldControllerBase.changePasswordVisibility');
    try {
      return super.changePasswordVisibility();
    } finally {
      _$_PasswordTextFieldControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showPassword: ${showPassword}
    ''';
  }
}
