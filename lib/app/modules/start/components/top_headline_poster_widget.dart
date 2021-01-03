import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/shared/models/article_model.dart';

class TopHeadlinePosterWidget extends StatelessWidget {
  final ArticleModel article;

  const TopHeadlinePosterWidget({Key key, @required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            padding: const EdgeInsets.only(right: 15.0),
            child: Text(
              article.title,
              style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 16),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: _size.width * 0.85,
            height: _size.height * 0.3,
            decoration: BoxDecoration(
              // color: Colors.amberAccent,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(article.urlToImage),
              ),
              // boxShadow: [
              //   BoxShadow(
              //       color: Colors.grey,
              //       offset: Offset(0, 5),
              //       spreadRadius: 5,
              //       blurRadius: 10)
              // ],
            ),
          ),
        ],
      ),
    );
  }
}
