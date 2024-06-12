import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // static Future<AppUser?> signUp(String email, String password) async {
  //   try {
  //     final UserCredential credential = await _firebaseAuth.
  //     createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     if(credential.user != null){
  //       return AppUser(uid: credential.user!.uid, email: credential.user!.email!
  //       );
  //   }
  //   return null;
  //   }
  //   catch(e) {
  //     return null;
  //   }
  // }
  // static Future<void> logOut() async {
  //   await _firebaseAuth.signOut();
  // }
  // static Future<AppUser?> login(String email, String password) async {
  //   try {
  //     final UserCredential credential = await _firebaseAuth.
  //     signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     if(credential.user != null){
  //       return AppUser(uid: credential.user!.uid, email: credential.user!.email!
  //       );
  //     }
  //     return null;
  //   }
  //   catch(e) {
  //     return null;
  //   }
  // }

User? getCurrentUser() {
  return _firebaseAuth.currentUser;
}
  String? getCurrentUserEmail() {
    User? user = _firebaseAuth.currentUser;
    return user?.email;
  }
Future<UserCredential> signInWithEmailAndPassword(String email, password) async {
  try {
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCredential;
  }
  on FirebaseAuthException catch (e) {
    throw Exception(e.code);
  }
}

  Future<UserCredential> signUpWithEmailAndPassword(String email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    }
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signOut() async {
  return await _firebaseAuth.signOut();
  }



}