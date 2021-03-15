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
}
