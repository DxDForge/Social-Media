import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media/components/my_drawer.dart';
import 'package:social_media/components/my_text_field.dart';
import 'package:social_media/service/SM_service/smService.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  //database  instance
  DataBase_SocialMediaService db =DataBase_SocialMediaService();

  // T E X T CONTROLLER
  final TextEditingController postTextEditingController =TextEditingController();

  // M E T H O D => ADD POST(data) TO FIRESTORE DAGTABASE
  addPostToFirestoreDB(String content){
    db.addPostToFirestoreDB(postTextEditingController.text);
    postTextEditingController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Home Page'),
      ),

      drawer: MyDrawer(),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Row(
              children: [
        
                Expanded(
                  child: MyTextField(controller: postTextEditingController, 
                  hintText: 'write a post', 
                  obscureTExt: false
                  ),
                ),
                  SizedBox(width: 10,),
                GestureDetector(
                  onTap:()=> addPostToFirestoreDB(postTextEditingController.text),
                  child: Container(
                    height: 55,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black
                    ),
                    child: Icon(Icons.done,color: Colors.white,),
                  ),
                )
        
        
              ],
            ),

            SizedBox(height: 20,),
        
            // D I S P L A Y  => POST
        
            Expanded(child: 
            StreamBuilder(
              stream: db.getPostDataFromFirestore(), 
              builder:(context, snapshot) {
                if (snapshot.hasData) {
                  final post =snapshot.data!;
                  return ListView.builder(
                    itemCount: post.length,
                    itemBuilder: (BuildContext context, int index) {
                      final indivisualPost=post[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                          ),
                          child: ListTile(
                            title: Text(indivisualPost['userName'],style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text(indivisualPost['content']),
                          ),
                        ),
                      );
                    },
                  );
                  
                }else{
                   return Container();
                }
        
                
              },))
          ],
        ),
      ),
    );
  }
}