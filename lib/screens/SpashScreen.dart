import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({super.key});

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen> {
  StartPlash(){
    Timer(Duration(seconds: 4), ()=> {
      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>home_screen()))
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StartPlash();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.white,
      body:
      Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/Image/1122111.png')),
            SizedBox(
              height: 20,
            ),
           Container(
             width: 250,
             decoration: BoxDecoration(
               color:parseColor("#1D9BFC") ,
               borderRadius: BorderRadius.circular(20),
             ),

               child: TextButton(onPressed: (){

                 Navigator.of(context).push(MaterialPageRoute(builder: (_)=>home_screen()));

                   }, child: Text('Start Trip',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w800,color: Colors.white),)))
          ],
        ),
      ),

    );
  }
  Color parseColor(String color) {
    String hex = color.replaceAll("#", "");
    if (hex.isEmpty) hex = "ffffff";
    if (hex.length == 3) {
      hex = '${hex.substring(0, 1)}${hex.substring(0, 1)}${hex.substring(1, 2)}${hex.substring(1, 2)}${hex.substring(2, 3)}${hex.substring(2, 3)}';
    }
    Color col = Color(int.parse(hex, radix: 16)).withOpacity(1.0);
    return col;
  }
}
