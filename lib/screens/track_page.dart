import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../models/student_model.dart';
import 'Live_Location.dart';
late final Dio dio;

class track_page extends StatelessWidget {
  const track_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/Image/44333.png')),
          SizedBox(
            height: 20,
          ),
          Container(

              decoration: BoxDecoration(
                color:parseColor("#1D9BFC") ,
                borderRadius: BorderRadius.circular(20),
              ),

              child: TextButton(onPressed: (){
                //getstudent(id);

              //  student_inf_List=[];


                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>LiveLocation()));

              }, child: Text('Start Live Location',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w800,color: Colors.white),)))
        ],
      ),
    );
  }
  // Future<void> getstudent() async {
  //
  //   final url = Uri.parse('https://gp-saveurkid.up.railway.app/api/student/show/${id}');
  //   http.Response response = await http.get(
  //     Uri.parse('https://gp-saveurkid.up.railway.app/api/student/show/${id}',),
  //
  //
  //   );
  //
  //
  //   if (response.statusCode == 200) {
  //
  //     var responseData = jsonDecode(response.body);
  //     grade = responseData['data']['grade'];
  //     Student_Name = responseData['data']['Student_Name'];
  //     class1 = responseData['data']['class'];
  //     // Successful login, handle response accordingly
  //     print('Login successful!');
  //     print('Response: ${response.body}');
  //
  //     // var responseData = jsonDecode(response.body);
  //     // token = responseData['data']['ID'];
  //     // Supervisor_Name = responseData['data']['Supervisor Name'];
  //     // Supervisor_email = responseData['data']['Supervisor email'];
  //     // print('Token: $token');
  //
  //
  //     // print(${response.body})
  //
  //
  //
  //   }
  //   else {
  //
  //     // Handle login failure
  //     print('Failed to login. Status code: ${response.statusCode}');
  //     print('Response: ${response.body}');
  //   }
  //
  // }





  // getstudent()async{
  //   //return await Future.delayed(const Duration(seconds: 3);
  //   var response=await Dio().get('https://gp-saveurkid.up.railway.app/api/student/show/${id}');
  //   Map<String,dynamic>jsonData=response.data;
  //   List<dynamic>articles=jsonData['data'];
  //
  //   for(var article in articles){
  //     studenInfomation articleModel=studenInfomation(name: article['FullName'], Image: article['Image'], id: article['ID'], grade: article['grade'], supervisor_id: article['Supervisor_ID'], Class: article['class']);
  //     articlesList.add(articleModel);
  //
  //   }
  //   print( articlesList);
  //
  //
  // }
  // Future<void> getstudent(id) async {
  //   try {
  //     var response = await Dio().get('https://gp-saveurkid.up.railway.app/api/student/show/$id');
  //     Map<String, dynamic> jsonData = response.data;
  //     List<dynamic> articles = jsonData['data'];
  //     List<studenInfomation > articlesList = [];
  //
  //     for (var article in articles) {
  //       studenInfomation  articleModel = studenInfomation (
  //         name: article['FullName'],
  //         Image: article['Image'],
  //         id: article['ID'],
  //         grade: article['grade'],
  //         supervisor_id: article['Supervisor_ID'],
  //         Class: article['class'],
  //       );
  //       articlesList.add(articleModel);
  //     }
  //
  //     print(articlesList);
  //   } catch (e) {
  //     print('Error fetching student data: $e');
  //   }
  // }
  // Future<void> getstudent(String id) async {
  //   try {
  //     var response = await Dio().get('https://gp-saveurkid.up.railway.app/api/student/show/$id');
  //     Map<String, dynamic> jsonData = response.data;
  //
  //     // Check if the response contains 'data' key
  //     if (jsonData.containsKey('data')) {
  //       var studentData = jsonData['data'];
  //       if (studentData is Map<String, dynamic>) {
  //         var student = studenInfomation(
  //           name: studentData['Student_Name'],
  //           Image: studentData['Image'],
  //           id: studentData['ID'],
  //           grade: studentData['grade'],
  //           supervisor_id: studentData['Supervisor_ID'],
  //           Class: studentData['class'],
  //         );
  //         print(student.name);
  //         print(student.grade);
  //         print(student.Class);
  //         print(student.id);
  //         print(student.Image);
  //         student_inf_List.add(student);
  //         print(student_inf_List[1].id);
  //
  //
  //       } else {
  //         print('Invalid format for student data');
  //       }
  //     } else {
  //       print('No data found in response');
  //     }
  //   } catch (e) {
  //     print('Error fetching student data: $e');
  //   }
  // }

}
