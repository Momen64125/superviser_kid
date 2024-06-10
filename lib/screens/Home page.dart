import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../main.dart';
import '../models/student_model.dart';
import 'package:http/http.dart' as http;


class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
// screenutil
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:  Colors.grey[200],

      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [


              Container(
                //color: Colors.cyan,
                height: height,
                width: width,
                child:  ListView.builder(

                  itemCount:student_inf_List.length,
                  itemBuilder: (BuildContext context, int index) {
                    return
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Container(
                          margin: EdgeInsets.all(15),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Color(0xff1D9BFC))),


                          child: ListTile(

                            leading:
                            CircleAvatar(
                              radius: 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),

                                child:  Image(image:
                                NetworkImage(
                                    '${student_inf_List.elementAt(index).Image}'??'assets/Image/photo_2024-04-19_00-33-08.jpg',
                                ),

                                 // base64.decode(student_inf_List.elementAt(index).Image),
                                  width: 300,
                                  height: 300,
                                ),

                                ),

                              ),


                            trailing:PopupMenuButton(itemBuilder: (context)=>[
                              PopupMenuItem(child: Text('On Bus'),value: 'On Bus',),
                              PopupMenuItem(child: Text('at Home'),value: 'at Home',),
                              PopupMenuItem(child: Text('at School'),value: 'at School',),
                            ],
                              onSelected: (String newValue){
                                // title1=newValue;

                                setState(() {
                                  //nv= insh{}
                                  // list.reomve where (id )
                                  student_inf_List.elementAt(index).status = newValue;
                                  updateStatus( student_inf_List.elementAt(index).id!, student_inf_List.elementAt(index).status);

                                  // student_inf_List.removeWhere((element) => student_inf_List.elementAt(index).status=='at Home');
                                   //student_inf_List.remove()

                                  print('${student_inf_List.elementAt(index).id}  ${newValue}');
                                  print(student_inf_List.elementAt(index).Image);

                                });

                              },
                            ),

                            title:
                            Column(
                              children: [
                                Text(

                                  '${student_inf_List.elementAt(index).name}',
                                  // d1[name],
                                  // name,

                                  style: TextStyle(color: Colors.black, fontSize: 15),),

                                Text(student_inf_List.elementAt(index).status),
                              ],
                            ),


                            subtitle: Row(

                              children: [
                                Text("Class : ${student_inf_List.elementAt(index).Class}",style: TextStyle(
                                  color: Colors.black,
                                ),),

                                Text("  grade : ${student_inf_List.elementAt(index).grade}",style: TextStyle(
                                  color: Colors.black,
                                ),),
                              ],
                            ),

                          ),

                        ),

                      );
                  },

                ),





              ),




            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ScanQr();

       getstudent(id!);

      },child: Image(image: AssetImage('assets/Image/Group 37.png'),),),
    );
  }

  Future<void>ScanQr()async{

    String scanValue=await FlutterBarcodeScanner.scanBarcode('', 'jh', false,ScanMode.DEFAULT);
    setState(() {
      qrstr.add(scanValue);
     print('#######################################################################################Mostafa mohamed taha ${scanValue}');
     id= int.parse(scanValue) ;

    });


  }



  Future<void> getstudent(int id) async {
    try {

      var response = await Dio().get('https://gp-saveurkid.up.railway.app/api/student/show/${id}',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      Map<String, dynamic> jsonData = response.data;

      // Check if the response contains 'data' key
      if (jsonData.containsKey('data')) {
        var studentData = jsonData['data'];
        if (studentData is Map<String, dynamic>) {
          var student = studenInfomation(
            name: studentData['Student_Name'],
            Image: studentData['Student Image'],
            id: studentData['ID'],
            grade: studentData['grade'],
            supervisor_id: studentData['Supervisor_ID'],
            Class: studentData['class'],
          );
          print(student.name);
          print(student.grade);
          print(student.Class);
          print(student.id);
          print(student.Image);
          student_inf_List.add(student);
          print(student_inf_List[1].id);


        } else {
          print('#########################################################Invalid format for student data');
        }
      } else {
        print('##########################################No data found in response');
      }
    } catch (e) {
      print('########################################################################################Error fetching student data: $e');
    }
  }
  // Future<void> getstudent(String id) async {
  //   try {
  //     var response = await http.get(Uri.parse('https://gp-saveurkid.up.railway.app/api/student/show/$id',
  //
  //     ),
  //
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //       },);
  //
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> jsonData = json.decode(response.body);
  //
  //       // Check if the response contains 'data' key
  //       if (jsonData.containsKey('data')) {
  //         var studentData = jsonData['data'];
  //         if (studentData is Map<String, dynamic>) {
  //           var student = studenInfomation(
  //             name: studentData['Student_Name'],
  //             Image: studentData['Student Image'],
  //             id: studentData['ID'],
  //             grade: studentData['grade'],
  //             supervisor_id: studentData['Supervisor_ID'],
  //             Class: studentData['class'],
  //           );
  //           print(student.name);
  //           print(student.grade);
  //           print(student.Class);
  //           print(student.id);
  //           print(student.Image);
  //           student_inf_List.add(student);
  //           print(student_inf_List[1].id);
  //         } else {
  //           print('Invalid format for student data');
  //         }
  //       } else {
  //         print('No data found in response');
  //       }
  //     } else {
  //       print('Failed to fetch student data. Status code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error fetching student data: $e');
  //   }
  // }





  Future<void> updateStatus(int studentID, String newStatus) async {
    final url = Uri.parse('https://gp-saveurkid.up.railway.app/api/changeStatus');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },

      body: {
        'student_ID': studentID.toString(),
        'Student_Status': newStatus,


      },
    );

    if (response.statusCode == 201) {
      print('succed');
      print(response.body);
    } else {
      print('erorr: ${response.reasonPhrase}');
      print('Failed . Status code: ${response.statusCode}');
    }
  }
}
