import 'package:flutter_news_app/app/shared/stores/theme_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'app_controller.g.dart';

@Injectable()
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final ThemeStore themeStore = Modular.get();
}
