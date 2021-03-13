import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/modules/start/submodules/trending/components/todays_read_card_widget.dart';
import 'package:flutter_news_app/app/shared/models/article_model.dart';

class TodaysReadWidget extends StatelessWidget {
  final List<ArticleModel> articles;

  const TodaysReadWidget({Key key, @required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: articles.length,
        itemBuilder: (_, index) {
          return TodaysReadCardWidget(
            article: articles[index],
          );
        },
      ),
    );
  }
}
