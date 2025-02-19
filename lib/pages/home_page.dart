import 'package:chat_app/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../components/my_drawer.dart';
import '../components/user_tile.dart';
import '../services/chat/chat_service.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();



  void logout() {

    _authService.signOut();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
            "Home",
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.w500)
        ),
        actions: [
          IconButton(
              color: Theme.of(context).colorScheme.inversePrimary,
              onPressed: logout, icon: Icon(Icons.logout)
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: _buildUserList()
    );

  }
  Widget _buildUserList(){
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return const Text("Error");
        }
        //loading
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Text("Loading..");
        }

        // relist view
        return ListView(
          children: snapshot.data!.map<Widget>((userData)=> _buildUserListItem(userData, context)).toList(),
        );
      }
    );
  }
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    final currentUserEmail = _authService.getCurrentUser();

    if (userData["email"] != currentUserEmail!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["email"],
                receiverID: userData['uid']
              ),
            ),
          );
        },
      );
    } else {
      // Return an empty container or some other widget if the condition is not met
      return Container();
    }
  }
}
