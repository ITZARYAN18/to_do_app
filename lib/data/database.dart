import 'package:hive/hive.dart';

class TodoDatabase{

  List toDo = [];

  final _mybox = Hive.openBox('mybox');

  void CreateInitialData(){
    toDo = [
      ["Make Tutorial",false],
      ["Do Exercise",false]
    ];
}
}