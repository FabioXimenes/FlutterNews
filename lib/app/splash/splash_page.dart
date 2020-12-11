import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/app/shared/constants.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );

    loading();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RotationTransition(
            turns: _animation,
            child: Center(
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 200,
              child: Image.asset('assets/images/newspaper.png'),
            ),
          ),
        ],
      ),
    );
  }
}

Future loading() async {
  Future.delayed(Duration(milliseconds: 800), () {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Modular.to.pushReplacementNamed(AppRoutes.login);
    } else {
      Modular.to.pushReplacementNamed(AppRoutes.start);
    }
  });
}
