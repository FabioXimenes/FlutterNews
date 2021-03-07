import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/shared/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomModalButtonSheet extends StatelessWidget {
  final ArticleModel article;

  const CustomModalButtonSheet({Key key, @required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final DateTime _date = DateTime.tryParse(article.publishedAt);

    return GestureDetector(
      onTap: () => _launchURL(article.url),
      child: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            SizedBox(height: 5),
            Text(
              article.title,
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_date.day}/${_date.month}/${_date.year}',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.grey),
                    ),
                    Text(
                      'by ${article.author}',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                Icon(
                  EvaIcons.bookmarkOutline,
                  color: Theme.of(context).accentColor,
                )
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: _size.height * 0.25,
              width: _size.width * 0.9,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(article.urlToImage),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(height: 10),
            Text(
              article.description,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.grey[900]),
              // overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
