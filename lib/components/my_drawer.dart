import 'package:flutter/material.dart';
import 'package:social_media/page/User_List_page.dart';
import 'package:social_media/page/profile_page.dart';
import 'package:social_media/service/auth_service/auth_Service.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  //instance of authservice
  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(child: Icon(Icons.app_settings_alt)),
              // N A V I G A T I O N  =>HOME
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () => Navigator.pop(context),
              ),

              // N A V I G A T I O N  =>USERLIST-PAGE
              ListTile(
                  leading: Icon(Icons.people),
                  title: Text('User List'),
                  onTap: () {
                    // Navigator.pop(context);
                    Navigator.pop(context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserListPage(),
                        ));
                  }),

              // N A V I G A T I O N  => PROFILE-PAGE
              ListTile(
                  leading: Icon(Icons.people),
                  title: Text('Profile Page'),
                  onTap: () {
                    // Navigator.pop(context);
                    Navigator.pop(context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(),
                        ));
                  }),
            ],
          ),

          // N A V I G A T I O N  =>EXIT
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sign Out'),
              onTap: () => auth.signOut(),
            ),
          )
        ],
      ),
    );
  }
}
