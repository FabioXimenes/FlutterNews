import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/modules/start/submodules/trending/components/top_headline_card_widget.dart';
import 'package:flutter_news_app/app/shared/models/article_model.dart';

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
