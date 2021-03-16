import 'package:flutter/material.dart';
import '../../shared/constants/misc.dart';
import '../../shared/constants/routes.dart';
import '../../shared/models/auth_model.dart';
import '../../shared/models/user_model.dart';
import '../../shared/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'sign_up_controller.g.dart';

@Injectable()
class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store implements Disposable {
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
  
  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
