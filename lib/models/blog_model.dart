import 'package:blog_app/models/category_model.dart';
import 'package:blog_app/models/user_model.dart';

class BlogModel {
  String? sId;
  UserModel? user;
  String? title;
  String? content;
  CategoryModel? category;
  String? description;
  String? thumbnail;
  String? createdAt;
  String? updatedAt;
  int? iV;

  BlogModel(
      {this.sId,
      this.user,
      this.title,
      this.content,
      this.category,
      this.description,
      this.thumbnail,
      this.createdAt,
      this.updatedAt,
      this.iV});

  BlogModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    title = json['title'];
    content = json['content'];
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
    description = json['description'];
    thumbnail = json['thumbnail'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['title'] = title;
    data['content'] = content;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['description'] = description;
    data['thumbnail'] = thumbnail;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}