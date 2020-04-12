import 'dart:convert';

import 'package:example_project/api/studentAPI.dart';
import 'package:example_project/interface/studentParentInterface.dart';
import 'package:http/http.dart' as http;
class studentDAO implements studentParentInterface{
  //Get all of students
  //To show student information
  //if the process can not get student by error, this will show error in console
  //else the process can get data, this will show a ItemList. Otherwise, show dialog("Can not connect link")
  //return json of student
  @override
  Future<List> getAll() async{
    // TODO: implement getAll
    final response=await http.get(studentAPI.API_GETSTUDENT);
    if(response.statusCode==200) {
      return json.decode(response.body);
    }
    else
      {
        throw Exception("Can not connect link");
      }
  }
}