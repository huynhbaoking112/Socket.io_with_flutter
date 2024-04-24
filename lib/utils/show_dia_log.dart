import 'package:flutter/material.dart';

void showDiaLogOnScreen(String content, String actionText, BuildContext context){
   showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(content),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            actions: [
              TextButton(onPressed: (){ Navigator.pop(context); }, child: Text(actionText))
            ],
          );
        },
      );
}