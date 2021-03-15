import 'package:flutter/material.dart';

import '../../../../../shared/models/article_model.dart';
import 'todays_read_card_widget.dart';

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
