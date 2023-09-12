import 'package:flutter/material.dart';
import 'package:todo_firebase/services/firestore_services.dart';
import 'package:todo_firebase/widgets/utilities/headings.dart';

import 'package:todo_firebase/models/todo_model.dart';

class TodoForm extends StatelessWidget {
  TodoForm({super.key});
  TextEditingController todoText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding: const EdgeInsets.all(15),
      padding: EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 35,
          ),
          Heading(type: 2, text: "Add To Do"),
          SizedBox(
            height: 35,
          ),
          TextField(
              controller: todoText,
              minLines: 2,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: "Enter new item ",
                filled: true,
                fillColor: Colors.green[50],
              ),
              autofocus: true),
          SizedBox(
            height: 15,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  TodoModel todoModel = TodoModel(text: todoText.text,isChecked: false);
                  TodoFirestore().addTodo(todoModel);
                },
                label: Text("Add"),
                icon: Icon(Icons.add),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 22)),
              )),
          SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}
