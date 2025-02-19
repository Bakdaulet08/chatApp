import 'package:flutter/material.dart';

import '../auth/auth_service.dart';
import '../components/my_button.dart';
import '../components/my_sec_textfield.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPWController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key, this.onTap});

  void register(BuildContext context){
    final _auth = AuthService();
    
    if (_pwController.text == _confirmPWController.text){
      try{
        _auth.signUpWithEmailPassword(_emailController.text, _pwController.text);
      }
      catch (e){
        showDialog(context: context, builder: (context)=> AlertDialog(
            title: Text(e.toString())
        )
        );
      }
    }else {
      showDialog(context: context, builder: (context)=> AlertDialog(
          title: Text("Passwords don't match!")
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
                "Let's create a new account for you",
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
              MySecTextfield(
                  hintText: "Confirm Password",
                  obscureText: true,
                  controller: _confirmPWController
              ),
              // login button
              const SizedBox(height:10),
              MyButton(
                text: "Register",
                onTap: ()=>register(context),

              ),

              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?  "),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Login now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // color: Theme.of(context).colorScheme.primary
                      )
                    ),
                  ),
                ],
              )


              // register now


            ]
        )
    );
  }
}
