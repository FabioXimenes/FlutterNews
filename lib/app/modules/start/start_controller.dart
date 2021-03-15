import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../shared/constants/routes.dart';
import '../../shared/repositories/user_repository.dart';
import '../../shared/stores/bookmark_store.dart';

part 'start_controller.g.dart';

@Injectable()
class StartController = _StartControllerBase with _$StartController;

abstract class _StartControllerBase with Store {
  final UserRepository userRepository = Modular.get();
  final PageController pageController = PageController();
  final BookmarkStore bookmarkStore = Modular.get();

  @observable
  int currentPage = 0;

  @action
  logout() async {
    await userRepository.signOut();
    Modular.to.pushReplacementNamed(AppRoutes.login);
  }

  @action
  void handlePageChange(int index) {
    currentPage = index;
    pageController.jumpToPage(index);
  }
}
