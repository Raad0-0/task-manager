import 'package:flutter/material.dart';
import 'package:task_manager/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onDeleteItem;

  const ToDoItem({super.key, required this.todo, this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ListTile(
        onTap: () {
          print('click Todo');
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        tileColor: Colors.white,
        title: Text(
          todo.todoText!,//not null send korte hbe
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          margin: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),

          ),
          child: IconButton(
            color: Colors.grey,
            iconSize: 25,
            icon: Icon(Icons.delete),
            onPressed: (){
              onDeleteItem(todo.id);
              print('delete clik');
            },
          ),
        ),
      ),
    );
  }
}
