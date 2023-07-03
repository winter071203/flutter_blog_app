import 'package:blog_app/models/reply_comment_model.dart';

class CommentModel {
  String? sId;
  List<ReplyCMModel>? replyCM;
  UserComment? user;
  String? content;
  String? blogId;
  String? blogUserId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CommentModel(
      {this.sId,
      this.replyCM,
      this.user,
      this.content,
      this.blogId,
      this.blogUserId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  CommentModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['replyCM'] != null) {
      replyCM = <ReplyCMModel>[];
      json['replyCM'].forEach((v) {
        replyCM!.add(new ReplyCMModel.fromJson(v));
      });
    }
    user = json['user'] != null ? new UserComment.fromJson(json['user']) : null;
    content = json['content'];
    blogId = json['blog_id'];
    blogUserId = json['blog_user_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.replyCM != null) {
      data['replyCM'] = this.replyCM!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['content'] = this.content;
    data['blog_id'] = this.blogId;
    data['blog_user_id'] = this.blogUserId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class UserComment {
  String? sId;
  String? avatar;
  String? name;

  UserComment({this.sId, this.avatar, this.name});

  UserComment.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    avatar = json['avatar'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    return data;
  }
}