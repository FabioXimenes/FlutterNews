// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $StartController = BindInject(
  (i) => StartController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StartController on _StartControllerBase, Store {
  final _$currentPageAtom = Atom(name: '_StartControllerBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$logoutAsyncAction = AsyncAction('_StartControllerBase.logout');

  @override
  Future logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$_StartControllerBaseActionController =
      ActionController(name: '_StartControllerBase');

  @override
  void handlePageChange(int index) {
    final _$actionInfo = _$_StartControllerBaseActionController.startAction(
        name: '_StartControllerBase.handlePageChange');
    try {
      return super.handlePageChange(index);
    } finally {
      _$_StartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage}
    ''';
  }
}
