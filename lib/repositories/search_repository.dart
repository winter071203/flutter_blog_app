import 'package:blog_app/models/home_blog_model.dart';
import 'package:blog_app/repositories/repository.dart';
import 'package:flutter/material.dart';

class SearchRepository {
  final Repository _repository = Repository();
  Future<dynamic> searchBlogs(String title) async {
    try {
      final response =
          await _repository.getApi('search/blogs?title=${title}', null) as List<dynamic>;
          if(response.isEmpty) {
            return [];
          } else return response.map((e) => HomeBlogModel.fromJson(e)).toList();
    } catch (e) {
      return debugPrint('getHomeBlogs error: $e');
    }
  }
}
