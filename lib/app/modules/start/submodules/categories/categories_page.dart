import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
    controller.tabController =
        TabController(length: controller.tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Container(
              height: 28,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TabBar(
                tabs: controller.tabs,
                controller: controller.tabController,
                isScrollable: true,
                labelColor: Colors.white,
                // labelStyle: Theme.of(context).textTheme.headline5,
                unselectedLabelColor: Colors.black,
                physics: BouncingScrollPhysics(),
                labelPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                indicator: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25)
                  // border: Border(
                  //   bottom: BorderSide(color: Colors.black, width: 3),
                  // ),
                ),
                indicatorColor: Colors.amber,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
            // TabBarView(
            //   controller: controller.tabController,
            //   children: [
            //     Expanded(child: Container()),
            //     Expanded(child: Container()),
            //     Expanded(child: Container()),
            //     Expanded(child: Container()),
            //     Expanded(child: Container()),
            //     Expanded(child: Container()),
            //     Expanded(child: Container()),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
