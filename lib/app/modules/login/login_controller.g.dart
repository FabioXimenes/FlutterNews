// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LoginController = BindInject(
  (i) => LoginController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$statusAtom = Atom(name: '_LoginControllerBase.status');

  @override
  UserStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(UserStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$userAtom = Atom(name: '_LoginControllerBase.user');

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$emailAtom = Atom(name: '_LoginControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$isEmailValidAtom = Atom(name: '_LoginControllerBase.isEmailValid');

  @override
  bool get isEmailValid {
    _$isEmailValidAtom.reportRead();
    return super.isEmailValid;
  }

  @override
  set isEmailValid(bool value) {
    _$isEmailValidAtom.reportWrite(value, super.isEmailValid, () {
      super.isEmailValid = value;
    });
  }

  final _$handleLoginAsyncAction =
      AsyncAction('_LoginControllerBase.handleLogin');

  @override
  Future<dynamic> handleLogin() {
    return _$handleLoginAsyncAction.run(() => super.handleLogin());
  }

  final _$handleSignInWithGoogleAsyncAction =
      AsyncAction('_LoginControllerBase.handleSignInWithGoogle');

  @override
  Future<dynamic> handleSignInWithGoogle() {
    return _$handleSignInWithGoogleAsyncAction
        .run(() => super.handleSignInWithGoogle());
  }

  final _$handleRecoverPasswordAsyncAction =
      AsyncAction('_LoginControllerBase.handleRecoverPassword');

  @override
  Future<dynamic> handleRecoverPassword() {
    return _$handleRecoverPasswordAsyncAction
        .run(() => super.handleRecoverPassword());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
user: ${user},
email: ${email},
isEmailValid: ${isEmailValid}
    ''';
  }
}
