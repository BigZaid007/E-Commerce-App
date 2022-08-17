import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zero/features/auth/screens/signUpScreen.dart';
import 'package:zero/global_varibales/global.dart';
import 'package:zero/provider/user_provider.dart';

import '../../../Screens/Home.dart';
import '../../../global_varibales/httpErrorHandle.dart';
import '../../../global_varibales/utilits.dart';
import '../../../models/user.dart';
import 'package:http/http.dart' as http;

import '../../../provider/user_provider.dart';
import '../../../provider/user_provider.dart';


//String uri='192.168.0.103:3000';

class AuthService {
  void signUpUser(
      {required name, required email, required password, required BuildContext context}) async {
    try {
      User user = User(
          '',
          name,
          email,
          password,
          '',
          '',
          '');

      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<userProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }


  void getUserData(BuildContext context,) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var user = Provider.of<userProvider>(context, listen: false);
        user.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

}
