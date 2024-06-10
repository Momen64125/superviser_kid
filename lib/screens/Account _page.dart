import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superviser_kid/main.dart';

class Account_page extends StatelessWidget {
  const Account_page({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/Image/istockphoto-1309328823-170667a.png')),
              Text('${Supervisor_Name}',style: TextStyle(fontSize: 40,),),
              SizedBox(height: 10,),
              Text('Personal Informatio',style: TextStyle(fontSize: 20),),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15)
                  ),

                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text('E-mail'),
                          Text('${Supervisor_email}',style: TextStyle(fontSize: 30),),
                        ],
                      ),
                      Divider(),
                      Column(
                        children: [
                          Text('Phone number'),
                          Text('01212308682',style: TextStyle(fontSize: 30),),
                        ],
                      ),
                      Divider(),
                      Column(
                        children: [
                          Text('Location'),
                          Text('Minya',style: TextStyle(fontSize: 30),),
                        ],
                      ),
                      Divider(),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
