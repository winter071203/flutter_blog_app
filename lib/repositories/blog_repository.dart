import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/models/blog_user_model.dart';
import 'package:blog_app/models/home_blog_model.dart';
import 'package:blog_app/repositories/repository.dart';
import 'package:flutter/material.dart';

class BlogRepository {
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


    Future<dynamic> getBlogsUser(String id) async {
    try {
      final res = await _repository.getApi(
          'blogs/user/$id?page=${1}&limit=${9}', null);
      return BLogUserModel.fromJson(res);
    } catch (e) {
      return debugPrint('getCategories error: $e');
    }
  }

  Future<dynamic> getBlogsByCategory(String id) async {
    try {
      final res =  await _repository.getApi('blogs/category/${id}', null) as List<dynamic>;
      return res.map((ele) {
        return BlogModel.fromJson(ele);
      }).toList();
    } catch(e) {
      return debugPrint('getBlogsByCategory error: $e');
    }
  }

  Future<dynamic> createBlog(Map<String, dynamic> data, String token) async {
    try {
      final res = await _repository.postApi('blog', data, token);
      return res;
    } catch(e) {
      return debugPrint('createBlog error: $e');
    }
  }
}
