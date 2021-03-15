import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/shared/constants.dart';
import 'package:flutter_news_app/app/shared/models/auth_model.dart';
import 'package:flutter_news_app/app/shared/models/user_model.dart';
import 'package:flutter_news_app/app/shared/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final formKey = GlobalKey<FormState>();
  final passwordResetEmailKey = GlobalKey<FormState>();
  final passwordResetEmailController = TextEditingController();
  final UserRepository userAuth = Modular.get();

  @observable
  UserStatus status = UserStatus.stopped;

  @observable
  UserModel user;

  @observable
  String email;

  @observable
  String password;

  @observable
  bool isEmailValid = false;

  @observable
  bool showPassword = false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void changePasswordVisibility() => showPassword = !showPassword;

  @action
  String validateEmail(String value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    if (!RegExp(pattern).hasMatch(value)) {
      return 'Please, insert a valid email!';
    }
    return null;
  }

  @action
  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please, insert your password!';
    }
    return null;
  }

  @action
  Future handleLogin() async {
    if (formKey.currentState.validate()) {
      status = UserStatus.loading;
      AuthModel auth = AuthModel(email: email, password: password);
      user = await userAuth.signInWithEmailAndPassword(auth);
      if (user.error != null) {
        status = UserStatus.error;
        print(user.errorMessage);
        // showDialog(context: context, child: Text('Error in login'));
      } else {
        status = UserStatus.success;
        Modular.to.pushReplacementNamed(AppRoutes.start);
      }
    }
  }

  @action
  Future handleSignInWithGoogle() async {
    status = UserStatus.loading;
    user = await userAuth.signInWithGoogle();
    if (user == null) {
      status = UserStatus.error;
    } else {
      Modular.to.pushReplacementNamed(AppRoutes.start);
    }
  }

  @action
  Future handleRecoverPassword() async {
    if (passwordResetEmailKey.currentState.validate()) {
      status = UserStatus.loading;
      var wasSent =
          await userAuth.recoverPassword(passwordResetEmailController.text);

      if (wasSent) {
        asuka.showSnackBar(
          SnackBar(
            content: Text('Email sent. Check your inbox!'),
          ),
        );
        status = UserStatus.success;
      } else {
        asuka.showSnackBar(
          SnackBar(
            content: Text(
              'Error while sending email. Check your email and try again later.',
            ),
          ),
        );
      }
    }
    status = UserStatus.stopped;
  }
}
