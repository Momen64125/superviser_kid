
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:superviser_kid/main.dart';
import 'package:superviser_kid/screens/Account%20_page.dart';
import 'package:superviser_kid/screens/Live_Location.dart';
import 'package:superviser_kid/screens/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:superviser_kid/screens/track_page.dart';

import 'Home page.dart';
import 'changePassword.dart';
//String gg='rty';

class home_screen extends StatefulWidget {
  const home_screen({super.key});
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);



  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {

  Color color=Colors.green;
  int current_index=0;

  int currentPageIndex=0;

  var scaffold_key=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(

      key: scaffold_key,
      appBar: AppBar(
       title:// Text('${gg}')
        // Text('student number ${student_inf_List.length}'),
       Text('student '),
      backgroundColor:  parseColor("#3495DF"),

      ),



      body:pages[currentPageIndex] ,







      bottomNavigationBar: NavigationBar(
        backgroundColor: parseColor("#1D9BFC"),

        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.white,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(

            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined,color: Colors.white,),
            label: 'Home',

          ),

          NavigationDestination(
            icon: Icon(Icons.location_on_outlined),
            label: 'Track',
          ),

          NavigationDestination(
            icon: Icon(Icons.person_pin),

            label: 'Account',
          ),
        ],
      ),





        drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(

                    decoration: BoxDecoration(
                      color:Colors.white,
                    ),
                    child: UserAccountsDrawerHeader(
                      margin: EdgeInsets.only(bottom: 0.0),
                      currentAccountPictureSize: Size.square(50),
                      currentAccountPicture: CircleAvatar(
                        radius: 50,

                        child: Image(image:

                        NetworkImage('${Supervisor_Image!}'),
                          ),//Text
                      ),
                      decoration: BoxDecoration(color: parseColor('#0D63A7'),),
                      accountName: Text('${ Supervisor_Name}',
                        style: TextStyle(fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      accountEmail: Text('${ Supervisor_email}', style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),),
                    )
                ),

                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Students '),
                  onTap: () {
                    currentPageIndex=0;
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>Home_page()));
                  },
                ),
                Divider(),
                ListTile(
                  leading: const Icon(Icons.location_on_rounded),
                  title: const Text(' Track '),
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>track_page()));


                  },
                ),
                Divider(),
                ListTile(
                  leading: const Icon(Icons.account_box),
                  title: const Text('My Account'),
                  onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Account_page()));
                // currentPageIndex=2;


                  },
                ),
                Divider(),
                ListTile(
                  leading: const Icon(Icons.lock),
                  title: const Text('Password'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
                  },
                ),
                Divider(),

                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('LogOut'),
                  onTap: () {
                    token=null;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  login_screen()),
                    );

                    // Timer(const Duration(seconds: 3), () {
                    //   showCircularProgressIndicator(context);
                    //   Navigator.of(context).pushAndRemoveUntil(
                    //     // the new route
                    //     MaterialPageRoute(
                    //       builder: (BuildContext context) => LoginScreen(),
                    //     ),
                    //
                    //
                    //         (Route route) => false,
                    //   );
                    // });


                  },
                ),
                Divider(),
              ],
            ))









    );




  }
 List<Widget>pages=[
   Home_page(),
   track_page(),
   Account_page(),



 ];
  Future<void>ScanQr()async{

    String scanValue=await FlutterBarcodeScanner.scanBarcode('', 'تم', true,ScanMode.QR);
    setState(() {
      //qrstr.add(scanValue);
      print('${scanValue}');
     // gg=scanValue;

    });
    // try{
    //   FlutterBarcodeScanner.scanBarcode('#2A99cf', 'cancel', true,  ScanMode.QR).then((value) {
    //     setState(() {
    //       qrstr=value;
    //     });
    //   });
    // }
    //     catch(e){
    //   setState(() {
    //
    //   });
    //     }

    }

  // Future<void> getstudent() async {
  //
  //     final url = Uri.parse('https://gp-saveurkid.up.railway.app/api/student/show/${id}');
  //     http.Response response = await http.get(
  //       Uri.parse('https://gp-saveurkid.up.railway.app/api/student/show/${id}',),
  //
  //
  //     );
  //
  //     if (response.statusCode == 200) {
  //
  //       var responseData = jsonDecode(response.body);
  //       grade = responseData['data']['grade'];
  //       Student_Name = responseData['data']['Student_Name'];
  //       class1 = responseData['data']['class'];
  //       // Successful login, handle response accordingly
  //       print('Login successful!');
  //       print('Response: ${response.body}');
  //
  //      // var responseData = jsonDecode(response.body);
  //       // token = responseData['data']['ID'];
  //       // Supervisor_Name = responseData['data']['Supervisor Name'];
  //       // Supervisor_email = responseData['data']['Supervisor email'];
  //      // print('Token: $token');
  //
  //
  //       // print(${response.body})
  //
  //
  //
  //     }
  //     else {
  //
  //       // Handle login failure
  //       print('Failed to login. Status code: ${response.statusCode}');
  //       print('Response: ${response.body}');
  //     }
  //
  // }

}