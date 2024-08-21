import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final String postText;
  final String emailText;
  const PostTile({super.key,required this.postText,required this.emailText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(postText,style: TextStyle(color: Colors.white),),
              Text(emailText,style: TextStyle(color: Colors.white24),),
            ],
          ),
        ),
      ),
    );
  }
}