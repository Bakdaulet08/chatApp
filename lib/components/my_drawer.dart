import 'package:flutter/material.dart';
import 'package:chat_app/auth/auth_service.dart';

import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void logout() {

    final _auth = AuthService();
    _auth.signOut();

  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.message,
                // color: Theme.of(context).colorScheme.primary,
                color: Colors.grey,
                size: 40
              ),
            )
          ),

          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Column(

              children:[
                Padding(
                    padding: const EdgeInsets.only(left:25),
                    child: ListTile(
                        title: Text("H O M E", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.w500)),
                        leading: Icon(Icons.home, color: Theme.of(context).colorScheme.inversePrimary),
                        onTap: () {
                          Navigator.pop(context);
                        }
                    )
                ),Padding(
                    padding: const EdgeInsets.only(left:25),
                    child: ListTile(
                        title: Text("S E T T I N G S", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.w500)),
                        leading: Icon(Icons.settings, color: Theme.of(context).colorScheme.inversePrimary),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingsPage(),
                            )
                          );
                        }
                    )
                ),
              ]
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:25, bottom: 25, top: 300),
            child: ListTile(
              title: Text("L O G O U T", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.w500)),
              leading: Icon(Icons.logout, color: Theme.of(context).colorScheme.inversePrimary),
              onTap: logout
            )
          ),
        ]
      )
    );
  }
}
