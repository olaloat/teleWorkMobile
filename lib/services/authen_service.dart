import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'dart:convert' as convert;
import 'package:telework_v2/services/authen_model.dart';

class AuthenService {
  static Future<bool> login(String username, String password) async {
    final response = await Http.post(
      Uri.parse('https://ap-telework-api.azurewebsites.net/Login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(<String, String>{
        'company': 'J632',
        'username': username,
        'password': password
      }),
    );
    if (response.statusCode == 200) {
      var content = Authen.fromJson(convert.jsonDecode(response.body));
      if (content.username != '') {
        print(Future<bool>.value(true));
  
        return Future<bool>.value(true);
      } else {
        return Future<bool>.value(false);
      }
    } else {
      print('NOT COMPLETED' + response.statusCode.toString());
      return Future<bool>.value(false);
    }
  }
}
