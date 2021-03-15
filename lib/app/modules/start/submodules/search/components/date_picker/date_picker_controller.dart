import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../shared/stores/query_store.dart';

part 'date_picker_controller.g.dart';

@Injectable(singleton: false)
class DatePickerController = _DatePickerControllerBase
    with _$DatePickerController;

abstract class _DatePickerControllerBase with Store {
  final QueryStore queryStore = Modular.get();

  @observable
  DateTime date;

  @observable
  Function(DateTime _date) setDate;

  @action
  handleDateChange(DateTime newDate) {
    setDate(newDate);
    date = newDate;
  }
}
