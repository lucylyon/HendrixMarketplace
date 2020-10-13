import 'package:firebase_auth/firebase_auth.dart';
import 'package:hendrix_marketplace/models/user.dart';


class loginService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Make init user class to pass between pages
  User _convert2User(FirebaseUser user){
    return user != null ? User(userName: user.displayName, uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_convert2User);
  }

// Lets user sign in with an email and password
  Future signInEmailPassword(String email, String password) async {
    try {
      AuthResult authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = authResult.user;
      return _convert2User(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

// Lets user sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}

//https://youtu.be/mZYuuGAIwe4