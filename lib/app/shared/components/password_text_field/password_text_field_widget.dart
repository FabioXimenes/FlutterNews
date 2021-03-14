import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/app/shared/components/password_text_field/password_text_field_controller.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController textFieldController;

  const PasswordTextFieldWidget({
    Key key,
    @required this.hintText,
    @required this.textFieldController,
  }) : super(key: key);

  @override
  _PasswordTextFieldWidgetState createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState
    extends ModularState<PasswordTextFieldWidget, PasswordTextFieldController> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: widget.textFieldController,
        validator: controller.validatePassword,
        obscureText: !controller.showPassword,
        decoration: InputDecoration(
          suffixIcon: Observer(builder: (_) {
            return IconButton(
              icon: controller.showPassword
                  ? Icon(
                      Icons.visibility_off,
                      color: Colors.grey,
                    )
                  : Icon(
                      Icons.visibility,
                      color: Colors.grey,
                    ),
              onPressed: controller.changePasswordVisibility,
            );
          }),
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      );
    });
  }
}
