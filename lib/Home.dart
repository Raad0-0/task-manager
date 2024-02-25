import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/todo.dart';
import 'package:task_manager/todo_item.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  final todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xffFAF9F6),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Task Manager"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              addTodoItem(todoController.text);
              //chap dile kisu hbe
            },
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 10, right: 5, left: 5),
            child: TextField(
              controller: todoController,
              onSubmitted: (text){
                setState(() {
                  if (text !=''){
                    todosList.add(ToDo(id: DateTime.now().toString(), todoText: text));

                  }else{

                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Textfield is empty')));
                  }
                });
                todoController.clear();
              }
              ,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Add Your Task",
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                for (ToDo todoo in todosList)
                  ToDoItem(
                    todo: todoo,
                    onDeleteItem: deleteTodoItem,
                  ), //1st todo is from todo_item
              ],
            ),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(onPressed: (){
        addTodoItem(todoController.text);
      },child: Icon(Icons.add),),
    );
  }

  void deleteTodoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void addTodoItem(String todo) {
    setState(() {
      if (todo !=''){
        todosList.add(ToDo(id: DateTime.now().toString(), todoText: todo));
      }else{

        ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Textfield is empty')));
      }
    });
    todoController.clear();
  }
}
