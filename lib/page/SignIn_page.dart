import 'package:flutter/material.dart';
import 'package:social_media/components/my_button.dart';
import 'package:social_media/components/my_text_field.dart';
import 'package:social_media/components/square_tile.dart';
import 'package:social_media/service/auth_service/auth_service.dart';

class SignInPage extends StatelessWidget {
  final void Function()? onTap;

  SignInPage({super.key, required this.onTap});

  // Controllers for text fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Method to handle sign in
  void signIn() {
    AuthService auth = AuthService();
    auth.signInWithEmailAndPassword(
      emailController.text,
      passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo or Welcome Back Text
                Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.login,
                        size: 100,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Sign in to continue',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),

                // Email Text Field
                Text(
                  'Email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 10),
                MyTextField(
                  controller: emailController,
                  hintText: 'Enter your email',
                  obscureTExt: false,
                ),
                SizedBox(height: 20),

                // Password Text Field
                Text(
                  'Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  obscureTExt: true,
                ),
                SizedBox(height: 20),

                // Sign In Button
                Center(
                  child: MyButton(
                    buttonName: 'Sign In',
                    onTap: signIn,
                  ),
                ),
                SizedBox(height: 30),

                // Divider with text
                Row(
                  children: [
                    Expanded(child: Divider(thickness: 1)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'or sign in with',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                    Expanded(child: Divider(thickness: 1)),
                  ],
                ),
                SizedBox(height: 30),

                // Social Media Login Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath: 'lib/images/google.png'),
                    SizedBox(width: 20),
                    SquareTile(imagePath: 'lib/images/apple.png'),
                  ],
                ),
                SizedBox(height: 30),

                // Switch to Create Account Page
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: onTap,
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
