import 'package:flutter/material.dart';

class MySecTextfield extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  const MySecTextfield(
      {super.key,
        required this.hintText,
        required this.obscureText,
        required this.controller, this.focusNode,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:10, left: 10, bottom: 7, top: 7),
      child: TextField(
          obscureText:obscureText,
          focusNode: focusNode,
          controller:controller,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),

              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
              ),
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.shade600)
          )
      ),
    );
  }
}
