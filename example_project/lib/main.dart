import 'dart:convert';


import 'package:example_project/dao/studentDAO.dart';
import 'package:example_project/interface/studentParentInterface.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dao/studentDAO.dart';
import 'dao/studentDAO.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
         appBar: AppBar(
           title: Text("Demo Project"),
         ),

        body: Home()
      )
    );
  }
}
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Home_State();
  }
}
class Home_State extends State<Home>{
 studentParentInterface studentdao=new studentDAO();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<List>(
      future: studentdao.getAll(),
      builder: (context,snapshot){
        if(snapshot.hasError)
          {
            print(snapshot.error);
          }
        else
          {
            return snapshot.hasData?new ItemList(list:snapshot.data):new AlertDialog(title: Text("Can not connect link"));
          }
      },
    );
  }
}
class ItemList extends StatelessWidget{
  List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(itemCount:list==null?0:list.length,itemBuilder: (context,index){
      return new Container(
              child: new ListTile(
                title: Text(list[index]['studentId']),
                leading: Image(
                  image: AssetImage("assets/images/background.jpg")
                ),
                subtitle: new Text("name:${list[index]['name']}"),
              )
      );
    } );
  }
}