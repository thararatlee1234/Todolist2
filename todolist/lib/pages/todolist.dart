//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:todolist/pages/add.dart';
import 'dart:convert';
//import 'package:async/async.dart' as http ;
import 'dart:async';
import 'package:http/http.dart' as http;
//import 'package:todolist/pages/home.dart';
import 'package:todolist/pages/update_todolist.dart'  ;
//import 'package:todolist/pages/http.dart';

class Todolist extends StatefulWidget {
  //const Todolist({ Key? key }) : super(key: key);

  @override
  _TodolistState createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  List todolistitems = ["a", "b", "c", "d"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodolist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPage())).then((value) =>{
                      setState((){
                      getTodolist();
  }
  )
                                
  }
  );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            setState((
              
              
            ) {
              getTodolist();
              
            });
            
           },
          //print('Del id =refresh.colo,
          icon: Icon(Icons.refresh,color: Colors.red,))
          
          
],
        title: Text('All Todolist'),
      ),
      body: todolistCreate(),
    );
  }

  Widget todolistCreate() {
    return ListView.builder(
        itemCount: todolistitems.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
                  title: Text("${todolistitems[index]["title"]}"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdatePage(
                                todolistitems[index]['id'],
                                todolistitems[index]['title'],
                                todolistitems[index]['detail']))).then((value) =>{
                                  setState((){
                                    print(value);
                                    if(value =='delete'){
                                      final snackBar = SnackBar(
                                        content: const Text('ลบรายการเรียบร้อยแล้ว!'),
                                        //action: SnackBarAction(
                                       // label: 'Undo',
                                        //onPressed: () {
                // Some code to undo the change.
                                      
            //),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }

                                    
                                    getTodolist();
                                  }
                                  )
                                
                                  }
                                  );
                    //UpdatePage(todolistitems[index]['id'],todolistitems[index]['title'],todolistitems[index]['detail']);
                  },
                  ),
                  );

        });
  }

  Future<void> getTodolist() async {
    List alltodo = [];

    /*var url = 'http://192.168.42.227:8000/api/all-todolist';*/
    var url = Uri.https('fcae-182-232-30-114.ngrok.io' ,'/api/all-todolist');
    var response = await http.get(url);
    //var result = json.decode (response.body);
    var result = utf8.decode(response.bodyBytes);
    print(result);
    setState(() {
      todolistitems = jsonDecode(result);
    });
  }
}
