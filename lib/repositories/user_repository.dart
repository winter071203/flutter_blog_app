import 'package:blog_app/models/user_model.dart';
import 'package:blog_app/repositories/repository.dart';
import 'package:flutter/widgets.dart';

class UserRepository {
  final Repository _repository = Repository();


  Future<dynamic> getUser(String id) async {
    try {
      final res = await _repository.getApi('user/${id}', null);
      return UserModel.fromJson(res);
    } catch(e) {
      return debugPrint('getUser error: $e');
    }
  }

  Future<dynamic> resetPassword(String newPassword, String token) async {
    try {
      final res = await _repository.patchApi('reset_password', {
        'password': newPassword
      }, token);
      return res['msg'];
    } catch(e) {
      return debugPrint('resetPassword error: $e');
    }
  }

  Future<dynamic> updateUser(String name, String avatar, String token) async {
    try {
      final res = await _repository.patchApi('user', {
        'name': name,
        'avatar': avatar
      }, token);
      return res['msg'];
    } catch(e) {
      return debugPrint('updateUser error: $e');
    }
  }
}