import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'start_controller.dart';

class StartPage extends StatefulWidget {
  final String title;
  const StartPage({Key key, this.title = "Start"}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends ModularState<StartPage, StartController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: controller.logout,
            color: Colors.white,
          )
        ],
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
