import 'dart:convert';
import 'package:http/http.dart' as http;

class ChangePasswordService {
  static late bool flag;
  static Future<void> changePassword(int id, String oldPassword,
      String newPassword, String confirmPassword, String token) async {
    final respons = await http.post(
        Uri.parse('https://gp-saveurkid.up.railway.app/api/ChangePassword/$id'),
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