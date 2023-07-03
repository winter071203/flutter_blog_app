import 'package:blog_app/models/user_model.dart';

class AuthModel {
  String? msg;
  String? accessToken;
  String? refreshToken;
  UserModel? user;

  AuthModel({msg, accessToken, user});

  AuthModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['msg'] = msg;
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
