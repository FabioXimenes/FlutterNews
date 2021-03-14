// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SignUpController = BindInject(
  (i) => SignUpController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpController on _SignUpControllerBase, Store {
  final _$userAtom = Atom(name: '_SignUpControllerBase.user');

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

  final _$emailAtom = Atom(name: '_SignUpControllerBase.email');

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

  final _$confirmPasswordAtom =
      Atom(name: '_SignUpControllerBase.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$isEmailValidAtom = Atom(name: '_SignUpControllerBase.isEmailValid');

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

  final _$showPasswordAtom = Atom(name: '_SignUpControllerBase.showPassword');

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

  final _$userStatusAtom = Atom(name: '_SignUpControllerBase.userStatus');

  @override
  UserStatus get userStatus {
    _$userStatusAtom.reportRead();
    return super.userStatus;
  }

  @override
  set userStatus(UserStatus value) {
    _$userStatusAtom.reportWrite(value, super.userStatus, () {
      super.userStatus = value;
    });
  }

  final _$handleRegisterAsyncAction =
      AsyncAction('_SignUpControllerBase.handleRegister');

  @override
  Future<dynamic> handleRegister() {
    return _$handleRegisterAsyncAction.run(() => super.handleRegister());
  }

  final _$_SignUpControllerBaseActionController =
      ActionController(name: '_SignUpControllerBase');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignUpControllerBaseActionController.startAction(
        name: '_SignUpControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setConfirmPassword(String value) {
    final _$actionInfo = _$_SignUpControllerBaseActionController.startAction(
        name: '_SignUpControllerBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validateEmail(String value) {
    final _$actionInfo = _$_SignUpControllerBaseActionController.startAction(
        name: '_SignUpControllerBase.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validatePassword(String value) {
    final _$actionInfo = _$_SignUpControllerBaseActionController.startAction(
        name: '_SignUpControllerBase.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validateConfirmPassword(String value) {
    final _$actionInfo = _$_SignUpControllerBaseActionController.startAction(
        name: '_SignUpControllerBase.validateConfirmPassword');
    try {
      return super.validateConfirmPassword(value);
    } finally {
      _$_SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
email: ${email},
confirmPassword: ${confirmPassword},
isEmailValid: ${isEmailValid},
showPassword: ${showPassword},
userStatus: ${userStatus}
    ''';
  }
}
