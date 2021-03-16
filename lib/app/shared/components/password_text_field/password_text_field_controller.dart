import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'password_text_field_controller.g.dart';

@Injectable(singleton: false)
class PasswordTextFieldController = _PasswordTextFieldControllerBase
    with _$PasswordTextFieldController;

abstract class _PasswordTextFieldControllerBase with Store {
  @observable
  bool showPassword = false;

  @action
  void changePasswordVisibility() => showPassword = !showPassword;
}
