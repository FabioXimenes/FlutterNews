import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/app/shared/components/custom_button_widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'sign_up_controller.dart';

class SignUpPage extends StatefulWidget {
  final String title;
  const SignUpPage({Key key, this.title = "SignUp"}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends ModularState<SignUpPage, SignUpController> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/newspaper.svg',
                  width: 80,
                  color: Theme.of(context).buttonColor,
                ),
                SizedBox(width: 20),
                Text(
                  'Flutter News',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(color: Colors.deepOrange[300]),
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(height: 40),
            Text('Sign Up',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1
                // .copyWith(color: Colors.deepOrange[300]),
                ),
            SizedBox(height: 10),
            Text(
              'Please sign up to know all the relevant facts that are occuring around the world!',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: controller.validateEmail,
                    decoration: InputDecoration(
                      // prefixIcon: Icon(Icons.mail),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
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
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: controller.changePasswordVisibility,
                          );
                        }),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: controller.setPassword,
                    );
                  }),
                  SizedBox(height: 10),
                  Observer(builder: (_) {
                    return TextFormField(
                      validator: controller.validateConfirmPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Confirm password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: controller.setConfirmPassword,
                    );
                  }),
                ],
              ),
            ),
            SizedBox(height: 25),
            CustomButtonWidget(
              title: 'Register',
              onPressed: controller.handleRegister,
            ),
            SizedBox(height: 15),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: 'Already have an account? ',
                    style: Theme.of(context).textTheme.subtitle1),
                TextSpan(
                  text: 'Login',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.deepOrange[300]),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Modular.to.pop();
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
