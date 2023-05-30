

import 'package:blog_app/models/blog_model.dart';

class BLogUserModel {
  List<BlogModel> blogs;
  int total;
  BLogUserModel({required this.blogs, required this.total});


  factory BLogUserModel.fromJson(Map<String, dynamic> json) {
    return BLogUserModel(
      blogs: json['blogs'] != null
          ? (json['blogs'] as List).map((i) => BlogModel.fromJson(i)).toList()
          : [],
      total: json['total'] ?? 0,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'blogs': blogs.map((e) => e.toJson()).toList(),
      'total': total,
    };
  }

}