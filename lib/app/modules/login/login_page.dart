import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/app/shared/components/custom_button_widget.dart';
import 'package:flutter_news_app/app/shared/components/password_text_field/password_text_field_widget.dart';
import 'package:flutter_news_app/app/shared/constants/misc.dart';
import 'package:flutter_news_app/app/shared/constants/routes.dart';
import 'package:flutter_news_app/app/shared/helpers/validators.dart';
import 'package:flutter_svg/svg.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 16),
            Container(
              height: 180,
              width: 180,
              child: SvgPicture.asset(
                'assets/images/newspaper.svg',
                color: Theme.of(context).iconTheme.color,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Flutter News',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(color: Colors.deepOrange[300]),
            ),
            SizedBox(height: 30),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: AppValidators.validateEmail,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    onChanged: controller.setEmail,
                  ),
                  SizedBox(height: 10),
                  PasswordTextFieldWidget(
                    hintText: 'Password',
                    textFieldController: controller.passwordController,
                    validator: AppValidators.validateEmptyPassword,
                  )
                ],
              ),
            ),
            // SizedBox(height: 10),
            Container(
              height: 35,
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      final bottom = MediaQuery.of(context).viewInsets.bottom;
                      return Padding(
                        padding: EdgeInsets.only(
                          top: 16,
                          left: 16,
                          right: 16,
                          bottom: 16 + bottom,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Recover password',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              SizedBox(height: 20),
                              Form(
                                key: controller.passwordResetEmailKey,
                                child: TextFormField(
                                  validator: AppValidators.validateEmail,
                                  controller:
                                      controller.passwordResetEmailController,
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                  onChanged: controller.setEmail,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Observer(builder: (_) {
                                  return CustomButtonWidget(
                                    title: 'SEND EMAIL',
                                    onPressed: controller.handleRecoverPassword,
                                    isLoading:
                                        controller.status == UserStatus.loading,
                                  );
                                }),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  child: Text(
                    'Forgot password?',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Observer(builder: (_) {
              return CustomButtonWidget(
                title: 'Login',
                onPressed: () async {
                  await controller.handleLogin();
                  if (controller.status == UserStatus.error) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Theme.of(context).backgroundColor,
                        title: Text('Error while logging in!',
                            style: Theme.of(context).textTheme.headline4),
                        content: Text(
                          controller.user.errorMessage,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        actions: [
                          TextButton(
                            child: Text(
                              'OK',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 16,
                              ),
                            ),
                            onPressed: Navigator.of(context).pop,
                          )
                        ],
                      ),
                    );
                  }
                },
                isLoading: controller.status == UserStatus.loading,
              );
            }),
            SizedBox(height: 15),
            Column(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  splashColor: Colors.deepOrange[100],
                  onTap: controller.handleSignInWithGoogle,
                  child: Container(
                    height: 40,
                    width: 170,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          EvaIcons.google,
                          color: Colors.grey,
                        ),
                        Text(
                          'Sign in with Google',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: 'Don\'t have an account? ',
                    style: Theme.of(context).textTheme.subtitle1),
                TextSpan(
                  text: 'Sign Up',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.deepOrange[300]),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Modular.to.pushNamed(AppRoutes.signUp);
                    },
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
