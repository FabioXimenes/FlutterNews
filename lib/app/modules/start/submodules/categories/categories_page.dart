import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/app/shared/components/article_card_widget.dart';
import 'package:flutter_news_app/app/shared/components/articles_list_view_widget.dart';
import 'categories_controller.dart';

class CategoriesPage extends StatefulWidget {
  final String title;
  const CategoriesPage({Key key, this.title = "Categories"}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState
    extends ModularState<CategoriesPage, CategoriesController>
    with SingleTickerProviderStateMixin {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();

    controller.getArticlesFromCategory(controller.currentIndex);

    controller.tabController =
        TabController(length: controller.tabs.length, vsync: this);

    controller.tabController.addListener(
      () {
        if (controller.tabController.index != controller.currentIndex) {
          return controller
              .getArticlesFromCategory(controller.tabController.index);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              Text(
                'CATEGORIES',
                style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Theme.of(context).accentColor, letterSpacing: 2),
              ),
              SizedBox(height: 20),
              Container(
                height: 28,
                child: TabBar(
                  tabs: controller.tabs,
                  controller: controller.tabController,
                  isScrollable: true,
                  labelColor: Colors.white,
                  labelStyle: Theme.of(context).textTheme.headline5,
                  unselectedLabelColor: controller.themeStore.isDark
                      ? Colors.white
                      : Colors.black,
                  physics: BouncingScrollPhysics(),
                  labelPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  indicator: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  indicatorColor: Colors.amber,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Observer(
                  builder: (_) {
                    return controller.isLoading
                        ? Center(child: CircularProgressIndicator())
                        : ArticlesListViewWidget(
                            articles:
                                controller.currentArticlesResponse.articles,
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
