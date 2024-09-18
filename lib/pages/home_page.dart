import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:flutter_application_1/pages/utilities/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_application_1/pages/utilities/dialog_box.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  // text controller
  final _controller = TextEditingController();

  List toDoList=[
    ["make Tutorial", false],
    ["do exercise", false],


  ];
  void checkboxchanged(bool? value,int index){
    setState(() {
      toDoList[index][1]=!toDoList[index][1];
    });

  }

  // save new task
  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text,false]);
      _controller.clear();

    });
    Navigator.of(context).pop();
  }

  void createNewTask(){
    showDialog(
      context: context, 
      builder:(context){
        return DialogBox(
          controller: _controller ,
          onSave: saveNewTask,
          onCancel:()=> Navigator.of(context).pop(),
        );

      },
    );

  }

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.yellow[200],
      appBar:AppBar(
        title:Center(child: const Text("TO DO ",style:TextStyle(fontSize:32,fontWeight:FontWeight.bold,))),
        elevation:0,
        backgroundColor:Colors.yellow[200],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:Colors.black,
        onPressed: createNewTask,
        child:const Icon(Icons.add,color:Color.fromARGB(255, 220, 252, 107)),


        ),
      body:ListView.builder(
        itemCount:toDoList.length ,
        itemBuilder:(context,index){
          return ToDoList(
            taskName:toDoList[index][0],
            taskCompleted:toDoList[index][1],
            onChanged:(value)=>checkboxchanged(value,index),
            deleteFunction: (context)=> deleteTask(index), 
          );
            

        },
      
      ),
        


    );
  }
}