import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/app/modules/start/submodules/settings/components/reset_password/reset_password_controller.dart';
import 'package:flutter_news_app/app/shared/components/password_text_field/password_text_field_widget.dart';

class ResetPasswordWidget extends StatefulWidget {
  @override
  _ResetPasswordWidgetState createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState
    extends ModularState<ResetPasswordWidget, ResetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: SingleChildScrollView(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reset password',
                style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Theme.of(context).accentColor,
                    ),
              ),
              SizedBox(height: 30),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    PasswordTextFieldWidget(
                      hintText: 'New password',
                      textFieldController: controller.passwordController,
                    ),
                    SizedBox(height: 10),
                    PasswordTextFieldWidget(
                      hintText: 'Confirm new password',
                      textFieldController: controller.passwordController,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: RaisedButton(
                  onPressed: controller.validate,
                  child: Text(
                    'RESET PASSWORD',
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
