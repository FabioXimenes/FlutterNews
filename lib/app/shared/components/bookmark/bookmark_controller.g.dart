// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $BookmarkController = BindInject(
  (i) => BookmarkController(),
  singleton: false,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BookmarkController on _BookmarkControllerBase, Store {
  final _$isBookmarkedAtom = Atom(name: '_BookmarkControllerBase.isBookmarked');

  @override
  bool get isBookmarked {
    _$isBookmarkedAtom.reportRead();
    return super.isBookmarked;
  }

  @override
  set isBookmarked(bool value) {
    _$isBookmarkedAtom.reportWrite(value, super.isBookmarked, () {
      super.isBookmarked = value;
    });
  }

  final _$checkArticleBookmarkAsyncAction =
      AsyncAction('_BookmarkControllerBase.checkArticleBookmark');

  @override
  Future checkArticleBookmark(String articleUrl) {
    return _$checkArticleBookmarkAsyncAction
        .run(() => super.checkArticleBookmark(articleUrl));
  }

  final _$setBookmarkAsyncAction =
      AsyncAction('_BookmarkControllerBase.setBookmark');

  @override
  Future setBookmark(String articleUrl) {
    return _$setBookmarkAsyncAction.run(() => super.setBookmark(articleUrl));
  }

  final _$removeBookmarkAsyncAction =
      AsyncAction('_BookmarkControllerBase.removeBookmark');

  @override
  Future removeBookmark(String articleUrl) {
    return _$removeBookmarkAsyncAction
        .run(() => super.removeBookmark(articleUrl));
  }

  @override
  String toString() {
    return '''
isBookmarked: ${isBookmarked}
    ''';
  }
}
