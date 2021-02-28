import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'search_controller.dart';

class SearchPage extends StatefulWidget {
  final String title;
  const SearchPage({Key key, this.title = "Search"}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ModularState<SearchPage, SearchController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: _size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10),
              Container(
                height: 50,
                width: _size.width * 0.95,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.search,
                      color: Theme.of(context).accentColor,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 25,
                        child: TextFormField(
                          controller: controller.searchFieldController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          textInputAction: TextInputAction.search,
                          onChanged: controller.setSearchQuery,
                          onFieldSubmitted: (value) {},
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Observer(
                      builder: (_) {
                        return controller.isSearchQueryEmpty
                            ? GestureDetector(
                                onTap: controller.clearSearchQuery,
                                child: Container(
                                  height: 18,
                                  width: 18,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.close_sharp,
                                    color: Colors.white.withOpacity(0.9),
                                    size: 15,
                                  ),
                                ),
                              )
                            : SizedBox();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
