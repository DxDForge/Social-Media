import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media/components/my_button.dart';
import 'package:social_media/components/my_text_field.dart';

class CreateAccounPage extends StatelessWidget {
  final void Function()? onTap;
   CreateAccounPage({super.key,required this.onTap});

  // CONTROLLER => T E X T 
  final TextEditingController nameController =TextEditingController();
  final TextEditingController emailController =TextEditingController();
  final TextEditingController passwordController =TextEditingController();
  final TextEditingController confirmPassController =TextEditingController();

  // M E T H O D => SIGN IN
  void createAccount(){

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
          
              // N A M E
              MyTextField(
                controller: nameController, 
                hintText: 'name',
                obscureTExt: false),
              
              // E M A I L
              MyTextField(
                controller: emailController, 
                hintText: 'email',
                obscureTExt: false),
          
              // P A S S W O R D
              MyTextField(
                controller: passwordController, 
                hintText: 'password', 
                obscureTExt: true),

              // C O N F I R M PASSWORD
              MyTextField(
                controller: confirmPassController, 
                hintText: 'confirm password',
                obscureTExt: true),
          
              // SIGNIN B U T T O N
              MyButton(
                buttonName: 'Sing In', 
                onTap: createAccount
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