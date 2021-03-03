// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SearchController = BindInject(
  (i) => SearchController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchController on _SearchControllerBase, Store {
  Computed<bool> _$isSearchQueryEmptyComputed;

  @override
  bool get isSearchQueryEmpty => (_$isSearchQueryEmptyComputed ??=
          Computed<bool>(() => super.isSearchQueryEmpty,
              name: '_SearchControllerBase.isSearchQueryEmpty'))
      .value;

  final _$searchQueryAtom = Atom(name: '_SearchControllerBase.searchQuery');

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  final _$isFilteringAtom = Atom(name: '_SearchControllerBase.isFiltering');

  @override
  bool get isFiltering {
    _$isFilteringAtom.reportRead();
    return super.isFiltering;
  }

  @override
  set isFiltering(bool value) {
    _$isFilteringAtom.reportWrite(value, super.isFiltering, () {
      super.isFiltering = value;
    });
  }

  final _$sortByAtom = Atom(name: '_SearchControllerBase.sortBy');

  @override
  String get sortBy {
    _$sortByAtom.reportRead();
    return super.sortBy;
  }

  @override
  set sortBy(String value) {
    _$sortByAtom.reportWrite(value, super.sortBy, () {
      super.sortBy = value;
    });
  }

  final _$loadingStatusAtom = Atom(name: '_SearchControllerBase.loadingStatus');

  @override
  LoadingStatus get loadingStatus {
    _$loadingStatusAtom.reportRead();
    return super.loadingStatus;
  }

  @override
  set loadingStatus(LoadingStatus value) {
    _$loadingStatusAtom.reportWrite(value, super.loadingStatus, () {
      super.loadingStatus = value;
    });
  }

  final _$articlesResponseAtom =
      Atom(name: '_SearchControllerBase.articlesResponse');

  @override
  ArticlesResponseModel get articlesResponse {
    _$articlesResponseAtom.reportRead();
    return super.articlesResponse;
  }

  @override
  set articlesResponse(ArticlesResponseModel value) {
    _$articlesResponseAtom.reportWrite(value, super.articlesResponse, () {
      super.articlesResponse = value;
    });
  }

  final _$searchAsyncAction = AsyncAction('_SearchControllerBase.search');

  @override
  Future search() {
    return _$searchAsyncAction.run(() => super.search());
  }

  final _$_SearchControllerBaseActionController =
      ActionController(name: '_SearchControllerBase');

  @override
  void setSearchQuery(dynamic value) {
    final _$actionInfo = _$_SearchControllerBaseActionController.startAction(
        name: '_SearchControllerBase.setSearchQuery');
    try {
      return super.setSearchQuery(value);
    } finally {
      _$_SearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSearchQuery() {
    final _$actionInfo = _$_SearchControllerBaseActionController.startAction(
        name: '_SearchControllerBase.clearSearchQuery');
    try {
      return super.clearSearchQuery();
    } finally {
      _$_SearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilteringFlag() {
    final _$actionInfo = _$_SearchControllerBaseActionController.startAction(
        name: '_SearchControllerBase.setFilteringFlag');
    try {
      return super.setFilteringFlag();
    } finally {
      _$_SearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSortOption(String value) {
    final _$actionInfo = _$_SearchControllerBaseActionController.startAction(
        name: '_SearchControllerBase.setSortOption');
    try {
      return super.setSortOption(value);
    } finally {
      _$_SearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchQuery: ${searchQuery},
isFiltering: ${isFiltering},
sortBy: ${sortBy},
loadingStatus: ${loadingStatus},
articlesResponse: ${articlesResponse},
isSearchQueryEmpty: ${isSearchQueryEmpty}
    ''';
  }
}
