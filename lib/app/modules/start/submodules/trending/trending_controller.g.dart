// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $TrendingController = BindInject(
  (i) => TrendingController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TrendingController on _TrendingControllerBase, Store {
  final _$articlesResponseAtom =
      Atom(name: '_TrendingControllerBase.articlesResponse');

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

  final _$getTopHeadlineArticlesAsyncAction =
      AsyncAction('_TrendingControllerBase.getTopHeadlineArticles');

  @override
  Future getTopHeadlineArticles() {
    return _$getTopHeadlineArticlesAsyncAction
        .run(() => super.getTopHeadlineArticles());
  }

  @override
  String toString() {
    return '''
articlesResponse: ${articlesResponse}
    ''';
  }
}
