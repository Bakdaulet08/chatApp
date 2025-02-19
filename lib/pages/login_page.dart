import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

import '../components/my_sec_textfield.dart';

class LoginPage extends StatelessWidget {

  //email and pw controller

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  final void Function()? onTap;

  LoginPage({
    super.key, this.onTap,

  });

  void login(BuildContext context) async{
    // auth service
    final authService = AuthService();

    // try login
    try {
      await authService.signInWithEmailPassword(_emailController.text, _pwController.text);


    }
    catch (e) {
      showDialog(context: context, builder: (context)=> AlertDialog(
        title: Text(e.toString())
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
          //logo
          Icon(
              Icons.message,
              size: 60,
              // color: Theme.of(context).colorScheme.primary,
          ),
          // welcome back message
          const SizedBox(height: 50),
          Text(
            "Welcome back, you've been missed!",
            style: TextStyle(
                // color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
            ),

          ),
            const SizedBox(height: 50),

            // email textfield
            MySecTextfield(
                hintText: "Email",
                obscureText: false,
                controller: _emailController,
            ),
          // pw textfield
            MySecTextfield(
                hintText: "Password",
                obscureText: true,
                controller: _pwController
            ),
          // login button
          const SizedBox(height:10),
          MyButton(
            text: "Login",
            onTap: () => login(context),

          ),

          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not a member?",
                // style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text("Register now",style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
              ),
            ],
          ),

          // register now


        ]
      )
    );
  }
}
