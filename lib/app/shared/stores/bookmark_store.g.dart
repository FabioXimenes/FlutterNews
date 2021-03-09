// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $BookmarkStore = BindInject(
  (i) => BookmarkStore(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BookmarkStore on _BookmarkStoreBase, Store {
  final _$bookmarksAtom = Atom(name: '_BookmarkStoreBase.bookmarks');

  @override
  ObservableList<Map<String, dynamic>> get bookmarks {
    _$bookmarksAtom.reportRead();
    return super.bookmarks;
  }

  @override
  set bookmarks(ObservableList<Map<String, dynamic>> value) {
    _$bookmarksAtom.reportWrite(value, super.bookmarks, () {
      super.bookmarks = value;
    });
  }

  final _$getBookmarksAsyncAction =
      AsyncAction('_BookmarkStoreBase.getBookmarks');

  @override
  Future getBookmarks() {
    return _$getBookmarksAsyncAction.run(() => super.getBookmarks());
  }

  final _$addBookmarkAsyncAction =
      AsyncAction('_BookmarkStoreBase.addBookmark');

  @override
  Future addBookmark(Map<String, dynamic> bookmark) {
    return _$addBookmarkAsyncAction.run(() => super.addBookmark(bookmark));
  }

  final _$removeBookmarkAsyncAction =
      AsyncAction('_BookmarkStoreBase.removeBookmark');

  @override
  Future removeBookmark(Map<String, dynamic> bookmark) {
    return _$removeBookmarkAsyncAction
        .run(() => super.removeBookmark(bookmark));
  }

  @override
  String toString() {
    return '''
bookmarks: ${bookmarks}
    ''';
  }
}
