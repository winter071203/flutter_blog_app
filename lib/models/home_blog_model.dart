import 'package:blog_app/models/blog_model.dart';

class HomeBlogModel {
  String? sId;
  String? name;
  int? count;
  List<BlogModel>? blogs;

  HomeBlogModel({this.sId, this.name, this.count, this.blogs});

  HomeBlogModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    count = json['count'];
    if (json['blogs'] != null) {
      blogs = <BlogModel>[];
      json['blogs'].forEach((v) {
        blogs!.add(BlogModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['count'] = this.count;
    if (this.blogs != null) {
      data['blogs'] = this.blogs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
