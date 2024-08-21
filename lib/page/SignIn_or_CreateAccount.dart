import 'package:flutter/material.dart';
import 'package:social_media/page/CreateAccount.dart';
import 'package:social_media/page/SignIn_page.dart';

class SignInOrCreateAccoun_SwapPageFunction extends StatefulWidget {
  const SignInOrCreateAccoun_SwapPageFunction({super.key});

  @override
  State<SignInOrCreateAccoun_SwapPageFunction> createState() => _SignInOrCreateAccoun_SwapPageFunctionState();
}

class _SignInOrCreateAccoun_SwapPageFunctionState extends State<SignInOrCreateAccoun_SwapPageFunction> {
  //initial Page 
   bool showLogInPage =true;

  // M E T H O D => toggle method to swap pages
  togglePage(){
    setState(() {
      showLogInPage = !showLogInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogInPage) {
      return SignInPage(
        onTap: togglePage
        );
    }else{
      return CreateAccounPage(
        onTap: togglePage
        );
    }
    
  }
}