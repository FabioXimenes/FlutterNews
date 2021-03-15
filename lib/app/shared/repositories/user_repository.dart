import 'package:flutter_modular/flutter_modular.dart';

import '../models/auth_model.dart';
import '../models/user_model.dart';
import '../services/interfaces/user_auth_interface.dart';

class UserRepository {
  final IUserAuth _auth = Modular.get();

  Future<UserModel> signInWithEmailAndPassword(AuthModel auth) async {
    return await _auth.signInWithEmailAndPassword(auth);
  }

  Future<UserModel> signInWithGoogle() async {
    try {
      return await _auth.signInWithGoogle();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserModel> registerUserWithEmailAndPassword(AuthModel auth) async {
    try {
      return await _auth.registerUserWithEmailAndPassword(auth);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signOut() async {
    try {
      await _auth.logout();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserModel> getCurrentUser() async {
    try {
      await _auth.getCurrentUser();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> recoverPassword(String email) async {
    try {
      await _auth.recoverPassword(email);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
