import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/shared/components/bookmark/bookmark_widget.dart';
import 'package:flutter_news_app/app/shared/components/custom_modal_bottom_sheet.dart';
import 'package:flutter_news_app/app/shared/models/article_model.dart';

class TodaysReadCardWidget extends StatelessWidget {
  final ArticleModel article;

  const TodaysReadCardWidget({Key key, @required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 120,
            margin: EdgeInsets.only(right: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(article.urlToImage))),
          ),
          SizedBox(height: 3),
          Container(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'CATEGORY',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Theme.of(context).accentColor, letterSpacing: 1),
                ),
                BookmarkWidget(
                  article: article,
                  color: Theme.of(context).accentColor,
                  size: 20,
                )
              ],
            ),
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
      ),
    );
  }
}
