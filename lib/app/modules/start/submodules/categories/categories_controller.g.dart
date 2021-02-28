// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CategoriesController = BindInject(
  (i) => CategoriesController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoriesController on _CategoriesControllerBase, Store {
  final _$currentArticlesResponseAtom =
      Atom(name: '_CategoriesControllerBase.currentArticlesResponse');

  @override
  ArticlesResponseModel get currentArticlesResponse {
    _$currentArticlesResponseAtom.reportRead();
    return super.currentArticlesResponse;
  }

  @override
  set currentArticlesResponse(ArticlesResponseModel value) {
    _$currentArticlesResponseAtom
        .reportWrite(value, super.currentArticlesResponse, () {
      super.currentArticlesResponse = value;
    });
  }

  final _$currentIndexAtom =
      Atom(name: '_CategoriesControllerBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CategoriesControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getArticlesFromCategoryAsyncAction =
      AsyncAction('_CategoriesControllerBase.getArticlesFromCategory');

  @override
  Future getArticlesFromCategory(int categoryIndex) {
    return _$getArticlesFromCategoryAsyncAction
        .run(() => super.getArticlesFromCategory(categoryIndex));
  }

  @override
  String toString() {
    return '''
currentArticlesResponse: ${currentArticlesResponse},
currentIndex: ${currentIndex},
isLoading: ${isLoading}
    ''';
  }
}
