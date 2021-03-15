import 'package:flutter_modular/flutter_modular.dart';

import '../../models/auth_model.dart';
import '../../models/user_model.dart';

abstract class IUserAuth implements Disposable {
  Future<UserModel> getCurrentUser();
  Future<UserModel> signInWithEmailAndPassword(AuthModel auth);
  Future<UserModel> registerUserWithEmailAndPassword(AuthModel auth);
  Future<UserModel> signInWithGoogle();
  Future<String> getSignInMethod();
  Future<void> resetPassword(String newPassword);
  Future<void> recoverPassword(String email);
  Future<void> logout();
}
