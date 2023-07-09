import 'dart:convert';
import 'dart:io';

import 'package:blog_app/models/user_model.dart';
import 'package:blog_app/repositories/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final Repository _repository = Repository();

  Future<dynamic> getUser(String id) async {
    try {
      final res = await _repository.getApi('user/${id}', null);
      return UserModel.fromJson(res);
    } catch (e) {
      return debugPrint('getUser error: $e');
    }
  }

  Future<dynamic> resetPassword(
      String currentPassword, String newPassword, String token) async {
    try {
      const String baseUrl = 'http://localhost:5000/api';
      final res = await http.patch(
        Uri.parse('$baseUrl/reset_password'),
        body: jsonEncode(
            {'current_password': currentPassword, 'password': newPassword}),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );
      Map<String, dynamic> data = {
        'statusCode': res.statusCode,
        'msg': jsonDecode(res.body)['msg']
      };
      print(data.toString());
      return data;
    } catch (e) {
      return debugPrint('resetPassword error: $e');
    }
  }

  Future<dynamic> updateUser(String name, String avatar, String token) async {
    try {
      final res = await _repository.patchApi(
          'user', {'name': name, 'avatar': avatar}, token);
      return res['msg'];
    } catch (e) {
      return debugPrint('updateUser error: $e');
    }
  }
}
