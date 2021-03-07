// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_picker_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DatePickerController = BindInject(
  (i) => DatePickerController(),
  singleton: false,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DatePickerController on _DatePickerControllerBase, Store {
  final _$dateAtom = Atom(name: '_DatePickerControllerBase.date');

  @override
  DateTime get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTime value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  final _$setDateAtom = Atom(name: '_DatePickerControllerBase.setDate');

  @override
  dynamic Function(DateTime) get setDate {
    _$setDateAtom.reportRead();
    return super.setDate;
  }

  @override
  set setDate(dynamic Function(DateTime) value) {
    _$setDateAtom.reportWrite(value, super.setDate, () {
      super.setDate = value;
    });
  }

  final _$_DatePickerControllerBaseActionController =
      ActionController(name: '_DatePickerControllerBase');

  @override
  dynamic handleDateChange(DateTime newDate) {
    final _$actionInfo = _$_DatePickerControllerBaseActionController
        .startAction(name: '_DatePickerControllerBase.handleDateChange');
    try {
      return super.handleDateChange(newDate);
    } finally {
      _$_DatePickerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
date: ${date},
setDate: ${setDate}
    ''';
  }
}
