import 'package:flutter/material.dart';
import 'package:social_media/components/my_button.dart';
import 'package:social_media/components/my_text_field.dart';
import 'package:social_media/service/auth_service/auth_service.dart';

class CreateAccountPage extends StatefulWidget {
  final void Function()? onTap;

  CreateAccountPage({super.key, required this.onTap});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  // Controllers for text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  // Method to handle account creation
  void createAccount() {
    if (passwordController.text == confirmPassController.text) {
      AuthService auth = AuthService();
      auth.createAccount(
        nameController.text,
        emailController.text,
        passwordController.text,
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Passwords do not match'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Heading
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Please fill in the details below to create a new account.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                const SizedBox(height: 30),

                // Name Text Field
                MyTextField(
                  controller: nameController,
                  hintText: 'Full Name',
                  obscureTExt: false,
                ),
                const SizedBox(height: 20),

                // Email Text Field
                MyTextField(
                  controller: emailController,
                  hintText: 'Email Address',
                  obscureTExt: false,
                ),
                const SizedBox(height: 20),

                // Password Text Field
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureTExt: true,
                ),
                const SizedBox(height: 20),

                // Confirm Password Text Field
                MyTextField(
                  controller: confirmPassController,
                  hintText: 'Confirm Password',
                  obscureTExt: true,
                ),
                const SizedBox(height: 40),

                // Sign Up Button
                Center(
                  child: MyButton(
                    buttonName: 'Sign Up',
                    onTap: createAccount,
                  ),
                ),
                const SizedBox(height: 30),

                // Divider
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[300],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'or sign up with',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Social Media Sign Up (example)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // IconButton(
                    //   icon: Icon(Icons.drive_eta),
                    //   iconSize: 60,
                    //   onPressed: () {},
                    // ),
                    const SizedBox(width: 5),
                    IconButton(
                      icon: Icon(Icons.apple,),
                      iconSize: 80,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Switching between SignIn and CreateAccount
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
