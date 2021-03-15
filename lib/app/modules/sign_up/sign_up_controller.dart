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
  final confirmPasswordController = TextEditingController();
  final UserRepository userAuth = Modular.get();

  @observable
  UserModel user;

  @observable
  String email;

  @observable
  UserStatus userStatus = UserStatus.stopped;

  @action
  void setEmail(String value) => email = value;

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
