import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_app/app/shared/models/user_model.dart';
import 'package:flutter_news_app/app/shared/models/auth_model.dart';
import 'package:flutter_news_app/app/shared/services/interfaces/user_auth_interface.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserFirebaseAuth implements IUserAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {}

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }

  @override
  Future<UserModel> registerUserWithEmailAndPassword(AuthModel auth) async {
    UserCredential credentials = await _auth.createUserWithEmailAndPassword(
        email: auth.email, password: auth.password);
    print(credentials);
    return UserModel(uid: credentials.user.uid, email: credentials.user.email);
  }

  @override
  Future<UserModel> signInWithEmailAndPassword(AuthModel auth) async {
    try {
      UserCredential credentials = await _auth.signInWithEmailAndPassword(
          email: auth.email, password: auth.password);
      return UserModel(
          uid: credentials.user.uid, email: credentials.user.email);
    } on FirebaseAuthException catch (e) {
      print(e);
      return UserModel.withError(e);
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential credentials = await _auth.signInWithCredential(credential);
    print(credentials);
    return UserModel(uid: credentials.user.uid, email: credentials.user.email);
  }

  @override
  Future<UserModel> getCurrentUser() async {
    User user = _auth.currentUser;
    return UserModel(uid: user.uid, email: user.email);
  }

  @override
  Future<String> getSignInMethod() async {
    var userInfo = _auth.currentUser.providerData;

    String signInMethod;

    for (var info in userInfo) {
      signInMethod = info.providerId;
    }

    return signInMethod;
  }

  @override
  Future resetPassword(String newPassword) async {
    var user = _auth.currentUser;

    user
        .updatePassword(newPassword)
        .then((value) => null)
        .catchError((error) {
          // TODO - IF USER HAS NOT RECENTLY SIGNED IN, THEN REAUTHENTICATE USER
        });
  }
}
