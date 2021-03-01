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
              Row(
                children: [
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 50,
                      // width: _size.width * 0.95,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                  ),
                  IconButton(
                    icon: Icon(Icons.filter_alt),
                    onPressed: controller.setFilteringFlag,
                  )
                ],
              ),
              SizedBox(height: 10),
              Observer(
                builder: (_) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: controller.isFiltering ? 180 : 0,
                    width: _size.width * 0.8,
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('from'),
                                Container(
                                  height: 30,
                                  width: 100,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('to'),
                                Container(
                                  height: 30,
                                  width: 100,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Order by: '),
                              SizedBox(width: 10),
                              DropdownButton(
                                value: controller.sortBy,
                                items: controller.sortOptions
                                    .map(
                                      (element) => DropdownMenuItem(
                                        child: Text(element),
                                        value: element,
                                      ),
                                    )
                                    .toList(),
                                onChanged: controller.setSortOption,
                              )
                            ],
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {},
                          child: Text(
                            'UPDATE',
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
