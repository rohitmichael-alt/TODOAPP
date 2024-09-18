import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
  List toDoList=[];

// reference the box
  final _myBox=Hive.box("mybox");

  void createIntialData() {
       toDoList=[
    ["Make Tutorial",false],
    ["Do Exercise",false],
  ];

  }

  void loadData(){

    toDoList=_myBox.get("TODOLIST");



  }

  void updateDatabase() {

    _myBox.put("TODOLIST",toDoList);



  }


}