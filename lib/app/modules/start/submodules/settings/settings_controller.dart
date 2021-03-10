import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'settings_controller.g.dart';

@Injectable()
class SettingsController = _SettingsControllerBase with _$SettingsController;

abstract class _SettingsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
