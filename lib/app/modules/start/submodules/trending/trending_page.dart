import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/app/modules/start/components/top_headline_poster_widget.dart';
import 'package:flutter_news_app/app/modules/start/components/top_headlines_widget.dart';
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
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
        child: ListView(
          children: <Widget>[
            Text(
              'TRENDING',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Theme.of(context).accentColor),
            ),
            SizedBox(height: 10),
            Observer(
              builder: (_) {
                return controller.articlesResponse != null
                    ? controller.articlesResponse.status == 'error'
                        ? Text('ERROR')
                        : TopHeadlinesWidget(
                            articlesResponse: controller.articlesResponse)
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
            Divider(height: 1, thickness: 1, color: Colors.grey,),
          ],
        ),
      ),
    );
  }
}
