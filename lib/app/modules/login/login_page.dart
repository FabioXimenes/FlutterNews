import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/app/shared/components/custom_button_widgets.dart';
import 'package:flutter_news_app/app/shared/constants.dart';
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
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 16),
            Container(
              height: 180,
              width: 180,
              child: SvgPicture.asset(
                'assets/images/newspaper.svg',
                color: Theme.of(context).buttonColor,
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
                    validator: controller.validateEmail,
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
                  Observer(builder: (_) {
                    return TextFormField(
                      validator: controller.validatePassword,
                      obscureText: !controller.showPassword,
                      decoration: InputDecoration(
                        suffixIcon: Observer(builder: (_) {
                          return IconButton(
                            icon: controller.showPassword
                                ? Icon(Icons.visibility_off, color: Colors.grey)
                                : Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                  ),
                            onPressed: controller.changePasswordVisibility,
                          );
                        }),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      onChanged: controller.setPassword,
                    );
                  }),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Forgot password?',
              textAlign: TextAlign.end,
            ),
            SizedBox(height: 25),
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
