import 'package:flutter/material.dart';
import 'package:to_do/utilities/buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;

  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    // final controller;
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(border: OutlineInputBorder(),
              hintText: "Add a New Task"),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Buttons(text: "Save", onPressed: onSave),
                      const SizedBox(width: 10,),
                Buttons(text: "Cancel", onPressed: onCancel),
              ],

            )
          ],
        ),
      ),
    );
  }
}
