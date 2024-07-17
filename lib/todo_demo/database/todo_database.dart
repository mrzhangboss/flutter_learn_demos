import 'package:hive/hive.dart';

class ToDoDatabase {
  List todosList = [];

  final _box = Hive.box('myBox');

  // init data
  void createInitialData() {
    todosList = [
      ["Make ToDo App", false],
      ["Learn Flutter", false],
    ];
  }

  // load data from database

  void loadData() {
    if (_box.get("TODOS") == null) {
      createInitialData();
    } else {
      todosList = _box.get("TODOS");
    }
  }

  // update database
  void updateDatabase() {
    _box.put("TODOS", todosList);
  }
}
