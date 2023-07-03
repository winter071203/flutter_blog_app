

import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/models/blog_user_model.dart';
import 'package:blog_app/models/user_model.dart';

abstract class UserState {
  final UserModel? user;
  final BLogUserModel? listBlogs;
  const UserState({required this.user, required this.listBlogs});
  @override
  List<Object> get props => [];
}

class GetUserInitial extends UserState {
  const GetUserInitial():super(user: null, listBlogs: null);
}
class GetUserLoading extends UserState {
  const GetUserLoading():super(user: null, listBlogs: null);
}
class GetUserFailed extends UserState {
  const GetUserFailed():super(user: null, listBlogs: null);
}
class GetUserSuccess extends UserState {
  final UserModel user;
  final BLogUserModel blogUser;
  const GetUserSuccess({required this.user, required this.blogUser}):super(user: user, listBlogs: blogUser);
  @override
  List<Object> get props => [user, blogUser];
  @override
  String toString() => 'GetUserSuccess { user: $user, listBlogs: $blogUser }';
}