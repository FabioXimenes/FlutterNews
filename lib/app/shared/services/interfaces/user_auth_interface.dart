import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/app/shared/models/auth_model.dart';
import 'package:flutter_news_app/app/shared/models/user_model.dart';

abstract class IUserAuth implements Disposable {
  Future<UserModel> getCurrentUser();
  Future<UserModel> signInWithEmailAndPassword(AuthModel auth);
  Future<UserModel> registerUserWithEmailAndPassword(AuthModel auth);
  Future<UserModel> signInWithGoogle();
  Future<String> getSignInMethod();
  Future resetPassword(String newPassword);
  Future<void> logout();
}
