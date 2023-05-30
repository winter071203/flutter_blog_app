import 'package:blog_app/models/blog_user_model.dart';
import 'package:blog_app/repositories/repository.dart';
import 'package:flutter/material.dart';

class BlogUserReposotory {
  final Repository _repository = Repository();
  Future<dynamic> getBlogsUser(String id) async {
    int limit = 3;
    String value = '?page=${1}';
    try {
      final res = await _repository.getApi(
          'blogs/user/${id}${value}&limit=${limit}', null);
      return BLogUserModel.fromJson(res);
    } catch (e) {
      return debugPrint('getCategories error: $e');
    }
  }
}
