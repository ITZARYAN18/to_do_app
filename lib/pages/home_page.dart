import 'package:flutter/material.dart';
import 'package:to_do/utilities/dialog_box.dart';

import '../utilities/to_do.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List toDo =[
    ["tada",true],
    ["tutu",false],
  ];

  void checkBox (bool? value,int index){
    setState(() {
      toDo[index][1] =!toDo[index][1];
    });
  }

  void createNewTask(){
    showDialog(context: context,
      builder: (context){
        return DialogBox();
      },
    );
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
              taskCompleted: toDo[index][1],
              taskName: toDo[index][0],
            );
          },
          itemCount: toDo.length,
        )


    );
  }
}