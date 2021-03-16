import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'components/custom_bottom_navigation_bar_widget.dart';
import 'submodules/bookmarks/bookmarks_module.dart';
import 'submodules/categories/categories_module.dart';
import 'submodules/search/search_module.dart';
import 'submodules/trending/trending_module.dart';
import 'start_controller.dart';
import 'submodules/settings/settings_module.dart';

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
          RouterOutlet(module: BookmarksModule()),
          RouterOutlet(module: SettingsModule()),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBarWidget(
        controller: controller.pageController,
      ),
    );
  }
}
