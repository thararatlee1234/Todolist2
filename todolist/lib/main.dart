import 'package:flutter/material.dart';
import 'package:todolist/pages/add.dart';
//import 'package:todolist/pages/home.dart';
import 'package:todolist/pages/todolist.dart';
import 'package:todolist/pages/update_todolist.dart';
import 'package:todolist/pages/todolist.dart';
//import 'package:webview_flutter/webview_flutter.dart';
//import 'package:layout/pages/web.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  //const ({ Key? key }) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Computer Knowladge",
      home: Todolist(),
      
    );
  }

  

}