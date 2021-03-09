import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/app/modules/start/components/custom_bottom_navigation_bar_widget.dart';
import 'package:flutter_news_app/app/modules/start/submodules/categories/categories_module.dart';
import 'package:flutter_news_app/app/modules/start/submodules/search/search_module.dart';
import 'package:flutter_news_app/app/modules/start/submodules/trending/trending_module.dart';
import 'start_controller.dart';

class StartPage extends StatefulWidget {
  final String title;
  const StartPage({Key key, this.title = "Start"}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends ModularState<StartPage, StartController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();
    controller.bookmarkStore.getBookmarks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          RouterOutlet(module: TrendingModule()),
          RouterOutlet(module: CategoriesModule()),
          RouterOutlet(module: SearchModule()),
          Container(),
          Container(color: Colors.red),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBarWidget(
        controller: controller.pageController,
      ),
    );
  }
}
