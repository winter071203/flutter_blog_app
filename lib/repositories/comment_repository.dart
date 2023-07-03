

import 'package:blog_app/models/comment_model.dart';
import 'package:blog_app/repositories/repository.dart';
import 'package:flutter/material.dart';

class CommentRepository {
  final Repository _repository = Repository();

  Future<dynamic> getComments(String id) async {
    try {
      final res = await _repository.getApi('comments/blog/${id}?page=${1}&limit=${12}', null) as List<dynamic>;
      return res.map((ele) {
        return CommentModel.fromJson(ele);
      }).toList();
    } catch(e) {
      return debugPrint(e.toString());
    }
  }

  Future<dynamic> createComment(String blogId, String blogUserId, String content, String token) async {
    try {
      final res = await _repository.postApi('comment', {
        'blog_id': blogId,
        'blog_user_id': blogUserId,
        'content': content
      }, token);
      return CommentModel.fromJson(res);
    } catch(e) {
      return debugPrint(e.toString());
    }
  }
}