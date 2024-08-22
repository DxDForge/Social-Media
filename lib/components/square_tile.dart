import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({super.key,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration( 
      borderRadius: BorderRadius.circular(5),
      color: Colors.grey[100],
      border:Border.all(color: Colors.white)
     ),
   
      height: 70,
      width: 70,
      
      child: Image.asset(imagePath),

    );
  }
}