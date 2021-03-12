import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/app/modules/start/submodules/settings/components/config_item_widget.dart';
import 'package:flutter_news_app/app/modules/start/submodules/settings/components/reset_password/reset_password_controller.dart';
import 'package:flutter_news_app/app/modules/start/submodules/settings/components/reset_password/reset_password_widget.dart';
import 'settings_controller.dart';

class SettingsPage extends StatefulWidget {
  final String title;
  const SettingsPage({Key key, this.title = "Settings"}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState
    extends ModularState<SettingsPage, SettingsController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();
    controller.getSignInMethod();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Container(
            width: _size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Text(
                  'SETTINGS',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Theme.of(context).accentColor,
                        letterSpacing: 1.5,
                      ),
                ),
                SizedBox(height: 30),
                Text(
                  'Account',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 10),
                ConfigItemWidget(
                  title: 'Change password',
                  onTap: () async {
                    if (controller.signInMethod != 'google.com') {
                      await showModalBottomSheet(
                        context: context,
                        builder: (_) => ResetPasswordWidget(),
                      );
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: Text(
                                  'You logged with Google. To reset your password change your gmail account password.',
                                  style:
                                      Theme.of(context).textTheme.subtitle1,
                                ),
                                actions: [
                                  TextButton(
                                    child: Text(
                                      'OK',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(
                                            color: Theme.of(context)
                                                .accentColor,
                                          ),
                                    ),
                                    onPressed: Navigator.of(context).pop,
                                  )
                                ],
                              ));
                    }
                  },
                ),
                SizedBox(height: 10),
                ConfigItemWidget(
                  title: 'Logout',
                  onTap: controller.onLogout,
                ),
                SizedBox(height: 30),
                Text(
                  'App settings',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 10),
                Container(
                  height: 40,
                  width: _size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dark Mode',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontSize: 16),
                      ),
                      Switch(
                        value: false,
                        onChanged: (_) {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                ConfigItemWidget(
                  title: 'About',
                  onTap: () => showAboutDialog(
                    context: context,
                    applicationIcon: Image.asset(
                        'assets/images/newspaper.png',
                        width: 80),
                    applicationName: 'Flutter News',
                    applicationVersion: '1.0.0',
                  ),
                ),
                Expanded(child: SizedBox()),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/images/newspaper.png',
                        width: 120,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Flutter News',
                      style: Theme.of(context).textTheme.headline4,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
