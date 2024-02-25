class ToDo {
  String? id;
  String? todoText;

  ToDo({
    required this.id,
    required this.todoText,

});


  static List<ToDo> todoList(){
    return[
      ToDo(id: '01', todoText: 'New Task' ),
      ToDo(id: '02', todoText: 'New Task' ),
      ToDo(id: '03', todoText: 'The the sun icon to Change modes' ),
    ];
  }
}
