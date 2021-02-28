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
  dynamic clearSearchQuery() {
    final _$actionInfo = _$_SearchControllerBaseActionController.startAction(
        name: '_SearchControllerBase.clearSearchQuery');
    try {
      return super.clearSearchQuery();
    } finally {
      _$_SearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchQuery: ${searchQuery},
isSearchQueryEmpty: ${isSearchQueryEmpty}
    ''';
  }
}
