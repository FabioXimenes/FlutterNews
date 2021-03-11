import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'reset_password_controller.g.dart';

@Injectable()
class ResetPasswordController = _ResetPasswordControllerBase
    with _$ResetPasswordController;

abstract class _ResetPasswordControllerBase with Store {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();

  validate() {
    formKey.currentState.validate();
  }
}
