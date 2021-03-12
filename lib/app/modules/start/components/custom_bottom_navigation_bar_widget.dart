import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBarWidget extends StatelessWidget {
  final PageController controller;

  const CustomBottomNavigationBarWidget({Key key, @required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, snapshot) {
        return Theme(
          data: Theme.of(context),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: controller.page?.round() ?? 0,
            onTap: controller.jumpToPage,
            items: [
              BottomNavigationBarItem(
                label: 'Trending',
                icon: Icon(EvaIcons.trendingUpOutline),
              ),
              BottomNavigationBarItem(
                label: 'Categories',
                icon: Icon(EvaIcons.gridOutline),
              ),
              BottomNavigationBarItem(
                label: 'Search',
                icon: Icon(EvaIcons.search),
              ),
              BottomNavigationBarItem(
                label: 'Saved',
                icon: Icon(EvaIcons.bookmarkOutline),
              ),
              BottomNavigationBarItem(
                label: 'Config',
                icon: Icon(EvaIcons.settings),
              ),
            ],
          ),
        );
      },
    );
  }
}
