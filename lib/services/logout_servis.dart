// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
//
// class LogoutScreen extends StatelessWidget {
//   final String apiUrl = 'https://yourapi.com/logout'; // Replace with your API endpoint
//
//   Future<void> logout(BuildContext context) async {
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         // You might need to pass some headers or data depending on your API
//         // headers: {...},
//         // body: {...},
//       );
//
//       if (response.statusCode == 200) {
//         // Successful logout
//         // Clear any user data or tokens stored locally
//         // Redirect user to login screen or any other appropriate screen
//         Navigator.pushReplacementNamed(context, '/login');
//       } else {
//         // Handle other status codes appropriately
//         // For example, if the server returns a 401 Unauthorized,
//         // it might mean the user's token is expired or invalid.
//         // You could handle it by clearing local data and redirecting to login.
//         throw Exception('Failed to logout');
//       }
//     } catch (error) {
//       // Handle errors such as network issues
//       print('Error: $error');
//       // Show error message to the user
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Failed to logout. Please try again later.'),
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Logout'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => logout(context),
//           child: Text('Logout'),
//         ),
//       ),
//     );
//   }
// }
//
//

//import 'dart:convert';

//
// import 'package:http/http.dart' as http;
//
// class LoginService {
//   Future<LoginModel> login({required String email, required String password}) async {
//     Uri url = Uri.parse(
//         'https://gp-saveurkid.up.railway.app/api/Parentlogin?Email=$email&Password=$password');
//     http.Response response = await http.post(url);
//
//     Map<String, dynamic> parentInfo = jsonDecode(response.body);
//
//     LoginModel loginModel
//     ‪ixx-efwb-yhs‬‏