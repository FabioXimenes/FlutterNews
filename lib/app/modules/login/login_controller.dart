import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../shared/constants/misc.dart';
import '../../shared/constants/routes.dart';
import '../../shared/models/auth_model.dart';
import '../../shared/models/user_model.dart';
import '../../shared/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store implements Disposable {
  final formKey = GlobalKey<FormState>();
  final passwordResetEmailKey = GlobalKey<FormState>();
  final passwordResetEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final UserRepository userAuth = Modular.get();

  @observable
  UserStatus status = UserStatus.stopped;

  @observable
  UserModel user;

  @observable
  String email;

  @observable
  bool isEmailValid = false;

  @action
  void setEmail(String value) => email = value;

  @action
  Future handleLogin() async {
    if (formKey.currentState.validate()) {
      status = UserStatus.loading;
      AuthModel auth =
          AuthModel(email: email, password: passwordController.text);
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

  @override
  void dispose() {
    passwordController.dispose();
    passwordResetEmailController.dispose();
  }
}
