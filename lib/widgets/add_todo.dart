import 'package:flutter/material.dart';
import 'package:todo_firebase/widgets/utilities/headings.dart';
class TodoForm extends StatelessWidget {
  const TodoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding: const EdgeInsets.all(15),
      padding: EdgeInsets.only(top: 20,  right: 20,  left: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 35,),
          Heading(type: 2, text: "Add To Do"),
          SizedBox(height: 35,),
          TextField(minLines: 2,maxLines: 10,decoration: InputDecoration(hintText: "Enter new item ",filled: true,fillColor: Colors.green[50],),autofocus: true),
          SizedBox(height: 15,),
          Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(onPressed: (){}, label: Text("Add"),icon: Icon(Icons.add),style: ElevatedButton.styleFrom(backgroundColor: Colors.green,foregroundColor: Colors.white,padding: EdgeInsets.symmetric(vertical: 12,horizontal: 22)),)),
          SizedBox(height: 35,),

          
        ],
      ),
    );
  }
}
