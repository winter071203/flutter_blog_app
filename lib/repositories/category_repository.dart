import 'package:blog_app/models/category_model.dart';
import 'package:blog_app/repositories/repository.dart';
import 'package:flutter/material.dart';

class CategoryRepository {
  final Repository _repository = Repository();
  Future<dynamic> getCategories() async {
    try {
      final res = await _repository.getApi('category', null) as List<dynamic>;
      return res.map((ele) {
        return CategoryModel.fromJson(ele);
      }).toList();
    } catch (e) {
      return debugPrint('getCategories error: $e');
    }
  }

  Future<dynamic> deleteCategories(String id, String token) async {
    try {
      await _repository.delApi('category/$id', token);
    } catch (e) {
      return debugPrint('deleteCategories error: $e');
    }
  }

  Future<dynamic> addCategory(String nameCategory, String token) async {
    try {
      final res =
          await _repository.postApi('category', {'name': nameCategory}, token);
      return CategoryModel.fromJson(res);
    } catch (e) {
      return debugPrint('addCategory error: $e');
    }
  }
}
