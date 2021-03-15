import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/constants/routes.dart';
import '../../../../shared/services/interfaces/user_auth_interface.dart';
import '../../../../shared/stores/theme_store.dart';

part 'settings_controller.g.dart';

@Injectable()
class SettingsController = _SettingsControllerBase with _$SettingsController;

abstract class _SettingsControllerBase with Store {
  final ThemeStore themeStore = Modular.get();
  final IUserAuth _userAuth = Modular.get();

  @observable
  String signInMethod;

  @action
  getSignInMethod() async {
    signInMethod = await _userAuth.getSignInMethod();
  }

  onLogout() async {
    await _userAuth.logout();
    Modular.to.pushReplacementNamed(AppRoutes.login);
  }
}
