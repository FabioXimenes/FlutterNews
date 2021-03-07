import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'query_store.g.dart';

@Injectable()
class QueryStore = _QueryStoreBase with _$QueryStore;

abstract class _QueryStoreBase with Store {
  @observable
  String message = '';

  @observable
  DateTime from = DateTime.now();
  
  @observable
  DateTime to = DateTime.now();
  
  @observable
  String sortBy;

  @action
  void setFromDate(DateTime date) => from = date;

  @action
  void setToDate(DateTime date) => to = date;
}
