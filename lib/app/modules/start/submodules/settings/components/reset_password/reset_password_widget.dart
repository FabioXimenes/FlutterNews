import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../shared/components/password_text_field/password_text_field_widget.dart';
import '../../../../../../shared/helpers/validators.dart';
import 'reset_password_controller.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reset password',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 30),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  PasswordTextFieldWidget(
                    hintText: 'New password',
                    textFieldController: controller.passwordController,
                    validator: AppValidators.validateNewPassword,
                  ),
                  SizedBox(height: 10),
                  PasswordTextFieldWidget(
                    hintText: 'Confirm new password',
                    textFieldController: controller.confirmPasswordController,
                    validator: (String value) =>
                        AppValidators.validateConfirmPassword(
                            controller.passwordController.text, value),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 50,
                width: 180,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: RaisedButton(
                  onPressed: () async {
                    await controller.onResetPassword();

                    if (controller.passwordStatus == PasswordStatus.success) {
                      Navigator.of(context).pop();
                      controller.passwordStatus = PasswordStatus.waiting;
                    }
                  },
                  child: Observer(
                    builder: (_) {
                      return controller.passwordStatus == PasswordStatus.loading
                          ? SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              'RESET PASSWORD',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(color: Colors.white),
                            );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
