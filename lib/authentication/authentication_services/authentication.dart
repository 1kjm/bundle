import 'package:bundle/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//create user based on firebase user
  UserModel _userFromFirebaseUser(User user) {
    return user != null
        ? UserModel(uid: user.uid, userEmail: user.email)
        : null;
  }

  Stream<UserModel> get streamUser {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

//to sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential anonymousSignInResult = await _auth.signInAnonymously();
      User firebaseUser = anonymousSignInResult.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  signOut() async {
    try {
      print('tried signing out');
      await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
