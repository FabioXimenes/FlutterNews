import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'password_text_field_controller.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController textFieldController;
  final Function(String value) validator;

  const PasswordTextFieldWidget({
    Key key,
    @required this.hintText,
    @required this.textFieldController,
    @required this.validator,
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
        validator: widget.validator,
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
