import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:superviser_kid/main.dart';

import '../models/TextFormComponenet.dart';
import 'package:http/http.dart' as http;

import 'login_screen.dart';
late  bool flag;

class ChangePassword extends StatelessWidget {
  static const String routeName='change password';
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController oldPass = TextEditingController();
    TextEditingController newPass = TextEditingController();
    TextEditingController confirmNewPass = TextEditingController();
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            backgroundColor: const Color(0xff0D63A7),
          )),
      body: Container(

        height: height*0.5,
        padding: EdgeInsetsDirectional.all(5),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0xff1F9CFC),
            borderRadius: BorderRadius.circular(12)),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Change Password',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
              TextFormComponenet(
                prefexIcon: Icon(Icons.lock),
                labelText: 'Old Password',
                controller: oldPass,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return 'please enter password';
                  }
                  if (text.length < 6) {
                    return 'password must have at least 6 chars';
                  }
                },
              ),
              TextFormComponenet(
                isPassword: true,
                prefexIcon: Icon(Icons.lock),
                labelText: 'New Password',
                controller: newPass,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return 'please enter New password';
                  }
                  if (text.length < 6) {
                    return 'password must have at least 6 chars';
                  }
                },
              ),
              TextFormComponenet(
                isPassword: true,
                prefexIcon: Icon(Icons.lock),
                labelText: 'Confirm Password',
                controller: confirmNewPass,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return 'please enter password';
                  }
                  if (text.length < 6) {
                    return 'password must have at least 6 chars';
                  }
                },
              ),
              ElevatedButton(
                  style:
                  ElevatedButton.styleFrom(primary: Color(0xff3495DF)),
                  onPressed: () {
                    if (formKey.currentState?.validate() == false) return;
                    changePassword(Supervisor_ID!,oldPass.text,newPass.text,confirmNewPass.text,token!);
                    showDialog(context: context, builder: (_){

                      return AlertDialog(

                        content: const Text('successfully'),
                        actions: [
                          TextButton(

                            onPressed: Navigator.of(context).pop,
                            child: const Text('Ok'),
                          ),
                        ],
                      );
                    });
                   

                  },
                  child: Text(
                    'Submot',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
  static Future<void> changePassword(int id, String oldPassword,
      String newPassword, String confirmPassword, String token) async {
    final respons = await http.post(
        Uri.parse('https://gp-saveurkid.up.railway.app/api/ChangeSVPassword/$id'),
        body:{
          'Old_Password':oldPassword,
          'Password':newPassword,
          'Password_confirmation':confirmPassword
        },
        headers: {
          'Authorization': 'Bearer $token',
        });
    var jsonData=jsonDecode(respons.body);


    if (respons.statusCode == 201) {
      print('password changed successfully');
      flag=true;
      print(flag);

      // LogoutService.logout(token);

    } else {
      flag=false;
      print(respons.statusCode);
      print(jsonData['message']);


    }
  }
}