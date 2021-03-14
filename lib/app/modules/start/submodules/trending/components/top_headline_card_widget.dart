import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/shared/components/bookmark/bookmark_widget.dart';
import 'package:flutter_news_app/app/shared/components/custom_modal_bottom_sheet.dart';
import 'package:flutter_news_app/app/shared/models/article_model.dart';

class TopHeadlinePosterWidget extends StatelessWidget {
  final ArticleModel article;

  const TopHeadlinePosterWidget({Key key, @required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          barrierColor: Colors.grey.withOpacity(0.8),
          useRootNavigator: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          context: context,
          builder: (_) {
            return CustomModalButtonSheet(article: article);
          },
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 55,
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                article.title,
                style: Theme.of(context).textTheme.headline4,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: _size.width * 0.85,
              height: _size.height * 0.3,
              decoration: BoxDecoration(
                // color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(article.urlToImage),
                ),
              ),
              child: Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.all(5),
                child: BookmarkWidget(
                  article: article,
                  color: Theme.of(context).accentColor,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
