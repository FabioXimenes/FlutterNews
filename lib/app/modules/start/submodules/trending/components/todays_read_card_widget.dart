import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/shared/models/article_model.dart';

class TodaysReadCardWidget extends StatelessWidget {
  final ArticleModel article;

  const TodaysReadCardWidget({Key key, @required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 120,
          width: 120,
          margin: EdgeInsets.only(right: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(article.urlToImage))),
        ),
        SizedBox(height: 3),
        Text(
          'CATEGORY',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Theme.of(context).accentColor, letterSpacing: 1),
        ),
        Container(
          height: 48,
          width: 120,
          child: Text(
            article.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: Theme.of(context).textTheme.headline6,
          ),
        )
      ],
    );
  }
}
