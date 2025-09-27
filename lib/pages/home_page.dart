import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/data/database.dart';
import 'package:to_do/utilities/dialog_box.dart';

import '../utilities/to_do.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _box = Hive.openBox('mybox');
  final _controller = TextEditingController();
   TodoDatabase db = TodoDatabase();


  void checkBox (bool? value,int index){
    setState(() {
      db.toDo[index][1] =!db.toDo[index][1];
    });
  }

  void CreateNewTask(){
      setState(() {
        db.toDo.add([_controller.text,false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
  }

  void createNewTask(){
    showDialog(context: context,
      builder: (context){
        return DialogBox(
          controller:_controller,
          onCancel:() => Navigator.of(context).pop(),
          onSave:CreateNewTask  ,

        );
      },
    );
  }

  void deleteTask(int index){
    setState(() {
     db.toDo.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(

          title: Center(child: Text("To-Do App")),
          elevation: 0,
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),),

        body: ListView.builder(
          itemBuilder: (context,index){
            return ToDoTile(
              onChanged: (value)=> checkBox(
                  value,
                  index),
              deleteFunction: (context) => deleteTask(index),
              taskCompleted:db.toDo[index][1],
              taskName: db.toDo[index][0],
            );
          },
          itemCount: db.toDo.length,
        )


    );
  }
}