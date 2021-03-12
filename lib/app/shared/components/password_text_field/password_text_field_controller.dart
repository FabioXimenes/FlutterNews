import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'password_text_field_controller.g.dart';

@Injectable(singleton: false)
class PasswordTextFieldController = _PasswordTextFieldControllerBase
    with _$PasswordTextFieldController;

abstract class _PasswordTextFieldControllerBase with Store {
  @observable
  bool showPassword = false;

  @action
  void changePasswordVisibility() => showPassword = !showPassword;

  @action
  String validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
    if (!RegExp(pattern).hasMatch(value)) {
      return 'The password must contain: \n \t * At least 6 characters \n \t * At least 1 upper case letter; \n \t * At least 1 lower case letter; \n \t * At least 1 number; \n \t * At least 1 special character;';
    }
    return null;
  }
}
