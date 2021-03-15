import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/components/articles_list_view_widget.dart';
import '../../../../shared/models/article_model.dart';
import 'bookmarks_controller.dart';

class BookmarksPage extends StatefulWidget {
  final String title;
  const BookmarksPage({Key key, this.title = "Bookmarks"}) : super(key: key);

  @override
  _BookmarksPageState createState() => _BookmarksPageState();
}

class _BookmarksPageState
    extends ModularState<BookmarksPage, BookmarksController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'YOUR SAVED ARTICLES',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Theme.of(context).accentColor,
                        letterSpacing: 1.5,
                      ),
                ),
              ),
              SizedBox(height: 10),
              Observer(builder: (_) {
                return Expanded(
                  child: controller.bookmarkStore.bookmarks.length > 0
                      ? ArticlesListViewWidget(
                          articles: controller.bookmarkStore.bookmarks
                              .map((element) => ArticleModel.fromJson(element))
                              .toList(),
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'No bookmarks!',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ],
                          ),
                        ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
