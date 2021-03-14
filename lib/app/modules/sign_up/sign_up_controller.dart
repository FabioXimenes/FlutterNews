import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/shared/constants.dart';
import 'package:flutter_news_app/app/shared/models/auth_model.dart';
import 'package:flutter_news_app/app/shared/models/user_model.dart';
import 'package:flutter_news_app/app/shared/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'sign_up_controller.g.dart';

@Injectable()
class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final UserRepository userAuth = Modular.get();

  @observable
  UserModel user;

  @observable
  String email;

  @observable
  String confirmPassword;

  @observable
  bool isEmailValid = false;

  @observable
  bool showPassword = false;

  @observable
  UserStatus userStatus = UserStatus.stopped;

  @action
  void setEmail(String value) => email = value;

  @action
  setConfirmPassword(String value) => confirmPassword = value;

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
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
    if (!RegExp(pattern).hasMatch(value)) {
      return 'The password must contain: \n \t * At least 6 characters \n \t * At least 1 upper case letter; \n \t * At least 1 lower case letter; \n \t * At least 1 number; \n \t * At least 1 special character;';
    }
    return null;
  }

  @action
  String validateConfirmPassword(String value) {
    if (value != passwordController.text) {
      return 'The passwords do not match!';
    }
    return null;
  }

  @action
  Future handleRegister() async {
    userStatus = UserStatus.loading;
    if (formKey.currentState.validate()) {
      AuthModel auth =
          AuthModel(email: email, password: passwordController.text);
      UserModel user = await userAuth.registerUserWithEmailAndPassword(auth);

      if (user == null) {
        userStatus = UserStatus.error;
      } else {
        Modular.to.pop();
        Modular.to.pushReplacementNamed(AppRoutes.start);
      }
    } else {
      userStatus = UserStatus.stopped;
    }
  }
}
