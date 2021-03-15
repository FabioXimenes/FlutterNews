import 'package:flutter/material.dart';
import 'article_card_widget.dart';
import '../models/article_model.dart';

class ArticlesListViewWidget extends StatelessWidget {
  final List<ArticleModel> articles;

  const ArticlesListViewWidget({
    Key key,
    @required this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (_, index) {
          return ArticleCardWidget(
            article: articles[index],
          );
        },
      ),
    );
  }
}
