import 'package:hive/hive.dart';

class TodoDatabase{

  List toDo =[
    // ["Make Tutorial",false],
    // ["Do Exercise",false],
  ];

  final _myBox = Hive.box('mybox');

  void createInitialData(){
    toDo = [
      ["Make Tutorial",false],
      ["Do Exercise",false],
    ];
}
  void loadData(){
    toDo = _myBox.get("TODOLIST");
  }

  void updateData(){
  _myBox.put("TODOLIST",toDo);
  }

}