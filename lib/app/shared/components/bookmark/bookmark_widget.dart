import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/app/shared/components/bookmark/bookmark_controller.dart';

class BookmarkWidget extends StatefulWidget {
  final String url;
  final Color color;
  final double size;

  const BookmarkWidget({
    Key key,
    @required this.url,
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
    controller.checkArticleBookmark(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return GestureDetector(
          onTap: () => controller.isBookmarked
              ? controller.removeBookmark(widget.url)
              : controller.setBookmark(widget.url),
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
