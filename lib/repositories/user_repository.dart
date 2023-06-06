


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
}