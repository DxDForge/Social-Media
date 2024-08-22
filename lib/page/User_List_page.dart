import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/service/SM_service/smService.dart';

class UserListPage extends StatelessWidget {
  UserListPage({super.key});

  //instance
  DataBase_SocialMediaService db = DataBase_SocialMediaService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: db.userDataList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Text('Error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            Text('Connecting...');
          }

          if (snapshot.hasData) {
            final users = snapshot.data!;

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                final user = users[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade200)
                  ),
                  child: ListTile(
                    leading: Icon(Icons.person),
                    
                    title: Text(user['userName'],style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(user['userEmail']),
                  ),
                );
              },
            );
          } else {
            return Text('No Data Available');
          }
        },
      ),
    );
  }
}
