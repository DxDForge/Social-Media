import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media/components/my_button.dart';
import 'package:social_media/components/my_text_field.dart';
import 'package:social_media/service/auth_service/auth_Service.dart';

class SignInPage extends StatelessWidget {
  final void Function()? onTap;
   SignInPage({super.key,required this.onTap});

  // CONTROLLER => T E X T 
  final TextEditingController emailController =TextEditingController();
  final TextEditingController passwordController =TextEditingController();

  // M E T H O D => SIGN IN
  void singIn(){
    
    AuthService auth =AuthService();
    auth.signInWithEmailAndPassword(
      emailController.text, 
      passwordController.text
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
    


      body: Center(
        
        child: Padding(
          padding: const EdgeInsets.only(top: 25,left: 25,right: 25,bottom: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //text field for sign in
          
              // E M A I L
              MyTextField(
                controller: emailController, 
                hintText: 'email',
                obscureTExt: false),
          
              //  P A S S W O R D
              MyTextField(
                controller: passwordController, 
                hintText: 'password', 
                obscureTExt: true),
          
              // SIGNIN B U T T O N
              MyButton(
                buttonName: 'Sing In', 
                onTap: singIn
                ),
          
              // S W I T C H I N G BETWEEN SINGIN_PAGE & CREATE_ACCOUNT_PAGE
              Row(
                children: [
                  Text('Don\'t have an account? '),
                  GestureDetector(
                    onTap: onTap,
                    child: Text('Create Account',
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),))
                ],
              )
            ],
          ),
        ),
      ),

      
    );
  }
}