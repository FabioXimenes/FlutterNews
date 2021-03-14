import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/shared/models/article_model.dart';
import 'package:flutter_news_app/app/shared/stores/bookmark_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;

part 'bookmark_controller.g.dart';

@Injectable(singleton: false)
class BookmarkController = _BookmarkControllerBase with _$BookmarkController;

abstract class _BookmarkControllerBase with Store {
  final BookmarkStore bookmarkStore = Modular.get();

  @observable
  bool isBookmarked = false;

  @action
  checkArticleBookmark(ArticleModel article) async {
    var index = bookmarkStore.bookmarks
        .indexWhere((element) => element['url'] == article.url);
    isBookmarked = index != -1;
  }

  @action
  setBookmark(ArticleModel article) async {
    bookmarkStore.addBookmark(article.toJson());
    isBookmarked = true;
  }

  @action
  removeBookmark(ArticleModel article) async {
    asuka.showDialog(
      builder: (context) => AlertDialog(
        content: Text(
          'Do you really want to remove the bookmark?',
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: Text(
              "Cancel",
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).accentColor,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              bookmarkStore.removeBookmark(article.toJson());
              isBookmarked = false;
            },
            child: Text(
              "Remove",
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).accentColor,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
