import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'trending_controller.dart';

class TrendingPage extends StatefulWidget {
  final String title;
  const TrendingPage({Key key, this.title = "Trending"}) : super(key: key);

  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState
    extends ModularState<TrendingPage, TrendingController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();
    controller.getTopHeadlineArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
