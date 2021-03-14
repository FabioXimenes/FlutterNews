import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/app/shared/components/bookmark/bookmark_controller.dart';
import 'package:flutter_news_app/app/shared/models/article_model.dart';

class BookmarkWidget extends StatefulWidget {
  final ArticleModel article;
  final Color color;
  final double size;

  const BookmarkWidget({
    Key key,
    @required this.article,
    @required this.color,
    this.size = 25.0,
  }) : super(key: key);

  @override
  _BookmarkWidgetState createState() => _BookmarkWidgetState();
}

class _BookmarkWidgetState
    extends ModularState<BookmarkWidget, BookmarkController> {
  @override
  void initState() {
    super.initState();
    controller.checkArticleBookmark(widget.article);
    controller.bookmarkStore.bookmarksLength.addListener(() {
      controller.checkArticleBookmark(widget.article);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return GestureDetector(
          onTap: () => controller.isBookmarked
              ? controller.removeBookmark(widget.article)
              : controller.setBookmark(widget.article),
            child: Icon(
              controller.isBookmarked
                  ? EvaIcons.bookmark
                  : EvaIcons.bookmarkOutline,
              size: widget.size,
              color: widget.color,
            ),
        );
      },
    );
  }
}
