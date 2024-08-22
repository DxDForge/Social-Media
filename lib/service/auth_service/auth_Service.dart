import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Instance of FirebaseAuth & Firestore
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;


   // M E T H O D => GET -CURRENT USER
   User? getCUrrentUser(){
    auth.currentUser;
   }

  

  // M E T H O D => SIGN-IN
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    final UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential;
  }

  // M E T H O D => CREATE-ACCOUNT
  Future<UserCredential> createAccount(String userName, String email, String password) async {
    try {
      // Create a new user with Firebase Authentication
      final UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save additional user details in Firestore
      await firestore.collection('Users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'userEmail': userCredential.user!.email!,
        'userName': userName,
      });

      print('User added to Firestore successfully!');

      return userCredential;
    } catch (e) {
      // Handle errors here
      print('Error creating account: $e');
      rethrow; // Re-throw the error after handling it
    }
  }

  // M E T H O D => SIGN-OUT
  Future<void> signOut() async {
    await auth.signOut();
  }
}
