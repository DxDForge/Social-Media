import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  // instance of F I R E B A S E - A U T H
  final FirebaseAuth auth =FirebaseAuth.instance;

  // M E T H O D => SIGN-IN
  Future<UserCredential> signInWithEmailAndPassword(String email,String password)async{
    final UserCredential userCredential =await auth.signInWithEmailAndPassword(
    email: email, 
    password: password
    );

    return userCredential;
  } 
}