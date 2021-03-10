import 'package:flutter_news_app/app/shared/constants.dart';
import 'package:flutter_news_app/app/shared/services/interfaces/user_auth_interface.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'settings_controller.g.dart';

@Injectable()
class SettingsController = _SettingsControllerBase with _$SettingsController;

abstract class _SettingsControllerBase with Store {
  final IUserAuth _userAuth = Modular.get();

  onLogout() async {
    await _userAuth.logout();
    Modular.to.pushReplacementNamed(AppRoutes.login);
  }
}
