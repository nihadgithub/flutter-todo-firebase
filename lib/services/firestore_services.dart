import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_firebase/models/todo_model.dart';

class TodoFirestore{
  FirebaseFirestore todosFirestore = FirebaseFirestore.instance;

  Future <void> addTodo(TodoModel todo) async{
      await todosFirestore.collection("todos").add({
        'text': todo.text,
        'isChecked':todo.isChecked
      });
  }

  Stream<QuerySnapshot<Object?>> getTodo() {
    return todosFirestore.collection("todos").snapshots();
  }
  Future <void> updateTodo(String todoId,bool isChecked) async{
    await todosFirestore.collection("todos").doc(todoId).update({
      "isChecked": isChecked
    });
  }

  Future <void> editTodo(String todoId,String text) async{
    print(text);
    await todosFirestore.collection("todos").doc(todoId).update({
      "text": text
    });
  }

  Future <void> deleteTodo(String todoId) async{
    await todosFirestore.collection("todos").doc(todoId).delete();
  }

}