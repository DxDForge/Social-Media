// if user A U T H E N T I C A T I O N done take the user to H O M E page
//else keep the user in sign or create account page 

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/page/Home_page.dart';
import 'package:social_media/page/SignIn_or_CreateAccount.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder:(context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          }else {
            return SignInOrCreateAccoun_SwapPageFunction();
          }
        },),
    );
  }
}