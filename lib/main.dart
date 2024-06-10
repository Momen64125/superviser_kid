

import 'package:flutter/material.dart';
import 'package:superviser_kid/screens/dddd.dart';
import 'package:superviser_kid/screens/login_screen.dart';

import 'models/student_model.dart';
List<studenInfomation>student_inf_List=[];
String? token;
String? Supervisor_Name;
String? Supervisor_email;
String? Supervisor_Image;
int ?Supervisor_ID;

int ?id;
String ?class1;
String ?grade;
String ?Student_Name;
List<String>  qrstr=[''];
Color parseColor(String color) {
  String hex = color.replaceAll("#", "");
  if (hex.isEmpty) hex = "ffffff";
  if (hex.length == 3) {
    hex = '${hex.substring(0, 1)}${hex.substring(0, 1)}${hex.substring(1, 2)}${hex.substring(1, 2)}${hex.substring(2, 3)}${hex.substring(2, 3)}';
  }
  Color col = Color(int.parse(hex, radix: 16)).withOpacity(1.0);
  return col;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor:  parseColor("#1D9BFC")),
        useMaterial3: true,
      ),
      home: login_screen(),
    );
  }
}
