import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../shared/services/interfaces/user_auth_interface.dart';
import '../../../../../../shared/stores/theme_store.dart';

part 'reset_password_controller.g.dart';

@Injectable()
class ResetPasswordController = _ResetPasswordControllerBase
    with _$ResetPasswordController;

enum PasswordStatus {
  waiting,
  loading,
  success,
  error,
}

abstract class _ResetPasswordControllerBase with Store implements Disposable {
  final ThemeStore themeStore = Modular.get();
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final IUserAuth _userAuth = Modular.get();

  @observable
  PasswordStatus passwordStatus = PasswordStatus.waiting;

  @action
  onResetPassword() async {
    passwordStatus = PasswordStatus.loading;

    if (formKey.currentState.validate()) {
      _userAuth.resetPassword(passwordController.text);

      await Future.delayed(Duration(milliseconds: 600));
      passwordStatus = PasswordStatus.success;
      await Future.delayed(Duration(milliseconds: 600));

      asuka.showSnackBar(SnackBar(content: Text('Password changed!')));
    } else {
      passwordStatus = PasswordStatus.error;
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
