// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $QueryStore = BindInject(
  (i) => QueryStore(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QueryStore on _QueryStoreBase, Store {
  final _$messageAtom = Atom(name: '_QueryStoreBase.message');

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  final _$fromAtom = Atom(name: '_QueryStoreBase.from');

  @override
  DateTime get from {
    _$fromAtom.reportRead();
    return super.from;
  }

  @override
  set from(DateTime value) {
    _$fromAtom.reportWrite(value, super.from, () {
      super.from = value;
    });
  }

  final _$toAtom = Atom(name: '_QueryStoreBase.to');

  @override
  DateTime get to {
    _$toAtom.reportRead();
    return super.to;
  }

  @override
  set to(DateTime value) {
    _$toAtom.reportWrite(value, super.to, () {
      super.to = value;
    });
  }

  final _$sortByAtom = Atom(name: '_QueryStoreBase.sortBy');

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

  final _$_QueryStoreBaseActionController =
      ActionController(name: '_QueryStoreBase');

  @override
  void setFromDate(DateTime date) {
    final _$actionInfo = _$_QueryStoreBaseActionController.startAction(
        name: '_QueryStoreBase.setFromDate');
    try {
      return super.setFromDate(date);
    } finally {
      _$_QueryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setToDate(DateTime date) {
    final _$actionInfo = _$_QueryStoreBaseActionController.startAction(
        name: '_QueryStoreBase.setToDate');
    try {
      return super.setToDate(date);
    } finally {
      _$_QueryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
message: ${message},
from: ${from},
to: ${to},
sortBy: ${sortBy}
    ''';
  }
}
