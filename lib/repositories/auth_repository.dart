import 'dart:convert';
import 'dart:io';

import 'package:blog_app/models/auth_model.dart';
import 'package:blog_app/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final Repository repository = Repository();
  Future<dynamic> login(String account, String password) async {
    try {
      final response = await repository.postApi(
          'login',
          {
            'account': account,
            'password': password,
          },
          null);
      return AuthModel.fromJson(response);
    } catch (e) {
      return debugPrint('login error: $e');
    }
  }

  Future<dynamic> register(Map<String, String> obj) async {
    try {
      const String baseUrl = 'http://localhost:5000/api';
      // final res = await repository.postApi('register', obj, null);
      final res = await http.post(Uri.parse('$baseUrl/register'), body: jsonEncode(obj), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      });
      Map<String, dynamic> data = {
        'statusCode': res.statusCode,
        'msg': jsonDecode(res.body)['msg']
      };
      print(data.toString());
      return data;
    } catch(err) {
      return debugPrint('register error: $err');
    }
  }

  Future<dynamic> refreshToken(String token) async {
    try {
      final response = await repository.getApi('refresh_token', token);
      return AuthModel.fromJson(response);
    } catch (e) {
      return debugPrint('refreshToken error: $e');
    }
  }

  Future<dynamic> logout(String token) async {
    try {
    final res = await repository.getApi('logout', token);
    return AuthModel.fromJson(res);
    } catch (e) {
      return debugPrint('logout error: $e');
    }
  }
}
