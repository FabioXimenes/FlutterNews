import 'package:flutter_news_app/app/shared/stores/query_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'date_picker_controller.g.dart';

@Injectable(singleton: false)
class DatePickerController = _DatePickerControllerBase
    with _$DatePickerController;

abstract class _DatePickerControllerBase with Store {
  final QueryStore queryStore = Modular.get();
}
