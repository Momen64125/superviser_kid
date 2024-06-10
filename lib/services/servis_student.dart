import 'package:dio/dio.dart';
import 'package:http/http.dart';

import '../models/student_model.dart';

class servis_studen{
  final Dio dio;
  servis_studen(this.dio);
 getstudent()async{
    //return await Future.delayed(const Duration(seconds: 3);
   var response=await dio.get('http://127.0.0.1:8000/api/student/show/1?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE3MTQxMDU4OTIsImV4cCI6MTcxNDEwOTQ5MiwibmJmIjoxNzE0MTA1ODkyLCJqdGkiOiJMNGNKSkZpTEFMN0RUYkR5Iiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.uQj5LZG_pKuqjLIS_QWAcZc-eFdMdpV_Kg9CIGrWX-o');
   Map<String,dynamic>jsonData=response.data;
   List<dynamic>articles=jsonData['articles'];
   List<studenInfomation>articlesList=[];
   for(var article in articles){
     studenInfomation articleModel=studenInfomation(name: article['FullName'], Image: article['Image'], id: article['ID'], grade: article['grade'], supervisor_id: article['Supervisor_ID'], Class: article['class']);
     articlesList.add(articleModel);
   }

}
}