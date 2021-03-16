import 'package:flutter/material.dart';
import 'top_headline_card_widget.dart';
import '../../../../../shared/models/article_model.dart';

class TopHeadlinesWidget extends StatelessWidget {
  final List<ArticleModel> articles;

  const TopHeadlinesWidget({Key key, @required this.articles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    
    return Container(
      width: _size.width,
      height: _size.height * 0.44,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return TopHeadlinePosterWidget(article: articles[index]);
        },
      ),
    );
  }
}
