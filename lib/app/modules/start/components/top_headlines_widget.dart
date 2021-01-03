import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/modules/start/components/top_headline_poster_widget.dart';
import 'package:flutter_news_app/app/shared/models/articles_response_model.dart';

class TopHeadlinesWidget extends StatelessWidget {
  final ArticlesResponseModel articlesResponse;

  const TopHeadlinesWidget({Key key, @required this.articlesResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: _size.height * 0.4,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: articlesResponse.articles.length,
        itemBuilder: (context, index) {
          return TopHeadlinePosterWidget(
              article: articlesResponse.articles[index]);
        },
      ),
    );
  }
}
