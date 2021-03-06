import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/shared/models/auth_model.dart';
import 'package:hurry/app/shared/models/user_model.dart';
import 'package:hurry/app/shared/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  @observable
  AuthModel auth = AuthModel();
  @observable
  UserModel user = UserModel();
  @observable
  bool loged = false;

  @action
  Future<void> login(password, email) async {
    auth = await AuthRepository().login(password, email);
    user = await AuthRepository().getMe(auth.authToken.toString());
    Modular.to.pop();
    loged = true;
    print(loged);
  }

  final googleSignIn = GoogleSignIn();

  Future loginGoogle() async {
    final user = await googleSignIn.signIn();
    if (user == null) {
      return;
    } else {
      final googleAuth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }

  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
