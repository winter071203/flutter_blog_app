

import 'package:blog_app/models/comment_model.dart';
import 'package:blog_app/repositories/repository.dart';
import 'package:flutter/material.dart';

class CommentRepository {
  final Repository _repository = Repository();

  Future<dynamic> getComments(String id) async {
    try {
      final res = await _repository.getApi('comments/blog/${id}', null) as List<dynamic>;
      return res.map((ele) {
        return CommentModel.fromJson(ele);
      }).toList();
    } catch(e) {
      return debugPrint(e.toString());
    }
  }
}