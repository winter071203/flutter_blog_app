import 'package:blog_app/models/auth_model.dart';
import 'package:blog_app/repositories/repository.dart';
import 'package:flutter/material.dart';

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

  Future<dynamic> refreshToken(String token) async {
    try {
      final response = await repository.getApi('refresh_token', token);
      return AuthModel.fromJson(response);
    } catch (e) {
      return debugPrint('refreshToken error: $e');
    }
  }
}
