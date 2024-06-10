
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superviser_kid/screens/SpashScreen.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class login_screen extends StatefulWidget {
   login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
   final  emailController =TextEditingController();

   final passwordController =TextEditingController();

   var formKey=GlobalKey<FormState>();

   var login_stat=0;

   var show_password=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(


            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children:[ Image.asset('assets/Image/photo_2024-04-19_00-33-08.jpg',width: 300,),
                Positioned(
                  top: 160,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      'Login',style: TextStyle(fontSize: 45,fontWeight: FontWeight.w800,color: parseColor("#1D9BFC")),),
                  ),
                ),
              ]),
               SizedBox(height: 50,),

              Stack(children:[ Image.asset('assets/Image/photo_2024-04-19_00-33-08.jpg',),

                Positioned(


                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0,right: 15,left: 15,),
                    child: Expanded(
                      child: Container(

                        width: 400,
                        height: 320,


                        decoration:BoxDecoration(
                          // color: parseColor("#1FA4FC"),

                          color: parseColor("#1F9CFC"),
                          borderRadius:BorderRadius.circular(50),
                          border:Border.all(
                              color:Colors.white,
                              width:8
                          ),

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TextFormField(

                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'email address must not be empty';
                                  }
                                  return null;
                                },
                                controller: emailController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,

                                  hintText: 'Email',
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),

                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TextFormField(

                                controller: passwordController,
                                obscureText: show_password,
                                validator: (value){
                                  if(value!.isNotEmpty){
                                    return null;
                                  }

                                  return 'Password must not be empty';
                                },
                                decoration: InputDecoration(
                                 filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Password',
                                
                                  prefixIcon:Icon(Icons.lock,),
                                  suffixIcon:IconButton(onPressed: (){
                                    setState(() {
                                      show_password=!show_password;
                                    });

                                   }, icon:show_password? Icon(Icons.visibility_off,):Icon(Icons.remove_red_eye_rounded,))
                                   ,
                                  border: OutlineInputBorder(


                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),

                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              // color:  Colors.deepPurpleAccent,
                              width: 150,
                              decoration:BoxDecoration(

                                color:  parseColor("#3495DF"),
                                borderRadius:BorderRadius.circular(50),


                              ),

                              child: TextButton(onPressed: (){


                                if(formKey.currentState!.validate()){
                                  print(passwordController.text);

                                }


                               login(context);
                                // if(login_stat==0){
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(content:Text('Login successful',),),
                                //   );
                                //
                                // }
                                // else{
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //  const   SnackBar(content:Text(' Failed to login',),),
                                //   );
                                // }

                                 }, child:Text(

                                'Login',style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white
                              ),),),
                            )
                          ],
                        ),
                      ),
                    ),

                  ),
                ),
              ]),

              Image.asset('assets/Image/photo_2024-04-19_00-33-08.jpg',height: 240,width: double.infinity,),

            ],
          ),
        ),
      ),

    );



  }

//login function
   Future<void> login(BuildContext context) async {
     if (formKey.currentState!.validate()) {
       String email = emailController.text;
       String password = passwordController.text;
       http.Response response = await http.post(
         Uri.parse('https://gp-saveurkid.up.railway.app/api/SVlogin',),
         body: {
           'Email': email,
           'Password': password,
         },

       );

       if (response.statusCode == 200) {
         ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content:Text('Login successful',),),
              );

         Navigator.pushReplacement(
           context,
           MaterialPageRoute(builder: (context) => const SpashScreen()),
         );
         login_stat=1;
         // Successful login, handle response accordingly
         print('Login successful!');
         print('Response: ${response.body}');

         var responseData = jsonDecode(response.body);
         token = responseData['data']['token'];
         Supervisor_Name = responseData['data']['Supervisor Name'];
         Supervisor_email = responseData['data']['Supervisor email'];
         Supervisor_Image = responseData['data']['Supervisor Image'];
         Supervisor_ID = responseData['data']['Supervisor ID'];
         print('Token: $token');


         // print(${response.body})



       } else {

         ScaffoldMessenger.of(context).showSnackBar(
            const   SnackBar(content:Text(' Failed to login',),),);
         // Handle login failure
         print('Failed to login. Status code: ${response.statusCode}');
         print('Response: ${response.body}');
       }
     }
   }
}
