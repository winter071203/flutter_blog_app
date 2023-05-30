import 'package:blog_app/models/home_blog_model.dart';
import 'package:blog_app/repositories/repository.dart';
import 'package:flutter/material.dart';

class HomeRepository {
  final Repository _repository = Repository();
  Future<dynamic> getHomeBlogs() async {
    try {
      final response =
          await _repository.getApi('home/blogs', null) as List<dynamic>;
      return response.map((ele) {
        return HomeBlogModel.fromJson(ele);
      }).toList();
    } catch (e) {
      return debugPrint('getHomeBlogs error: $e');
    }
  }
}
