import 'package:flutter/material.dart';

import '../database/todo_database.dart';
import '../utils/dialog_box.dart';
import '../utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
      db.loadData();
  }


  // on task change
  void changeTaskState(bool? value, int index) {
    setState(() {
      db.todosList[index][1] = !db.todosList[index][1];
    });
    db.updateDatabase();
  }

  final addTaskController = TextEditingController();

  void onSave() {
    setState(() {
      db.todosList.add([addTaskController.text, false]);
      addTaskController.clear();
    });
    db.updateDatabase();
    Navigator.of(context).pop();
  }

  // on create task
  void onCreateTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: addTaskController,
            onCancel: () => Navigator.of(context).pop(),
            onSave: onSave,
          );
        });
  }

  void onDeleteTask(int index) {
    setState(() {
      db.todosList.removeAt(index);
    });
    db.updateDatabase();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ToDo Demo'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: onCreateTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: db.todosList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                text: db.todosList[index][0],
                checked: db.todosList[index][1],
                onChanged: (_) => changeTaskState(_, index),
                onDeleted: (_) => onDeleteTask(index),
              );
            }));
  }
}
