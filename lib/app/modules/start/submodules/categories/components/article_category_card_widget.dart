import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/shared/components/custom_modal_bottom_sheet.dart';
import 'package:flutter_news_app/app/shared/models/article_model.dart';

class ArticleCategoryCardWidget extends StatelessWidget {
  final ArticleModel article;

  const ArticleCategoryCardWidget({
    Key key,
    @required this.article,
  }) : super(key: key);

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
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ), // margin: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    article.urlToImage,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 2),
                  Expanded(
                    child: Text(
                      article.description,
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                            color: Colors.grey,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
