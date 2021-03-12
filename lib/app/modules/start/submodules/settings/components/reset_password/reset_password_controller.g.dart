// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ResetPasswordController = BindInject(
  (i) => ResetPasswordController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResetPasswordController on _ResetPasswordControllerBase, Store {
  final _$passwordStatusAtom =
      Atom(name: '_ResetPasswordControllerBase.passwordStatus');

  @override
  PasswordStatus get passwordStatus {
    _$passwordStatusAtom.reportRead();
    return super.passwordStatus;
  }

  @override
  set passwordStatus(PasswordStatus value) {
    _$passwordStatusAtom.reportWrite(value, super.passwordStatus, () {
      super.passwordStatus = value;
    });
  }

  final _$onResetPasswordAsyncAction =
      AsyncAction('_ResetPasswordControllerBase.onResetPassword');

  @override
  Future onResetPassword() {
    return _$onResetPasswordAsyncAction.run(() => super.onResetPassword());
  }

  @override
  String toString() {
    return '''
passwordStatus: ${passwordStatus}
    ''';
  }
}
