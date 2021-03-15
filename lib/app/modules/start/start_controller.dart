import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/shared/constants/routes.dart';
import 'package:flutter_news_app/app/shared/repositories/user_repository.dart';
import 'package:flutter_news_app/app/shared/stores/bookmark_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
