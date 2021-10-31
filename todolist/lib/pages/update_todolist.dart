import 'dart:convert';
//import 'package:async/async.dart' as http ;
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
//import 'package:todolist/pages/detail.dart';
import 'package:todolist/pages/todolist.dart';
//import 'package:todolist/pages/http.dart';

class UpdatePage  extends StatefulWidget {
  final v1,v2,v3;
  const UpdatePage (this.v1,this.v2,this.v3);
    //TextEditingController todo_title = TextEditingController();
    //TextEditingController todo_detail = TextEditingController();

  @override
  _UpdatePageState createState() => _UpdatePageState();
   
   
}
class _UpdatePageState extends State<UpdatePage > {
  var _v1,_v2,_v3;
  TextEditingController todo_title = TextEditingController();
  TextEditingController todo_detail = TextEditingController();
@override
void initState() {
  // TODO: implement ini
  super.initState();
  _v1= widget.v1;
  _v2= widget.v2;
  _v3= widget.v3;
  todo_title.text = _v2;
  todo_detail.text = _v3;
  
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('แก้ไขข้อมูล'),
      actions: [

        IconButton(onPressed: (){ 
        print('Del id = $_v1');
        deleteTodo();
        Navigator.pop(context,'delete');},
        icon: Icon(Icons.delete,color: Colors.red,))
      ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          TextField(
             
            controller: todo_title,
            decoration: InputDecoration(
              labelText:'รายการที่ต้องทำ',
              border: OutlineInputBorder()
              
            ),
        ),
          SizedBox(height: 30,),
          TextField(
            minLines: 4,
            maxLines: 8,
            controller: todo_detail,
            decoration: InputDecoration(
              labelText:'รายละเอียด',
              border: OutlineInputBorder()
            ),
        ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(50),
            child: ElevatedButton(onPressed:(){
              print('-----------------');
              print('title:${todo_title.text}');
              print('title : ${todo_detail.text}');
              Updatetodo();
              final snackBar = SnackBar(
              content: const Text('อัพเดตรายการเรียบร้อยแล้ว'),);
            //),

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
ScaffoldMessenger.of(context).showSnackBar(snackBar);
},
  //action: SnackBarAction(
 // label: 'Undo',
  //onPressed: () {

                                      
              //setState(() {
                //todo_title.clear();
                //todo_detail.clear();
              //});

            //},    
            
            child: Text('แก้ไข'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              padding: MaterialStateProperty.all(
                  EdgeInsets.fromLTRB(50, 20, 50, 20)),
              textStyle:
                  MaterialStateProperty.all(TextStyle(fontSize: 30)))),
          ),  

        ]),
      )

      );    
      
    
  }
  Future Updatetodo()async{
    //var url = Uri.https('abcde.bgrij.or','/api/post-todolist');
    var url = Uri.https('fcae-182-232-30-114.ngrok.io','/api/update-todolist/$_v1');
    
    Map<String, String> header = {"Content-type":"application/json"};
    String jsondata = '{"title":"${todo_title.text}", "detail":"${todo_detail.text}"}';
    var response = await http.put(url,headers: header,body:jsondata);
        
        
       
       //;headers: header ,body: jsondata);
    print('--------------------');
    print(response.body);
      


  }


Future deleteTodo ()async{
  var url = Uri.https('fcae-182-232-30-114.ngrok.io','/api/delete-todolist/$_v1');
    
  Map<String, String> header = {"Content-type":"application/json"};
  var response = await http.delete(url,headers: header);
   
   
      
  print('--------------------');
  print(response.body);
  

}

}




























