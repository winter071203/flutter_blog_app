import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/models/blog_user_model.dart';
import 'package:equatable/equatable.dart';

abstract class BlogUserState extends Equatable {
  const BlogUserState();
  @override
  List<Object> get props => [];
}

class BlogUserInitial extends BlogUserState {}

class BlogUserLoading extends BlogUserState {}

class BlogUserFailure extends BlogUserState {}

class BlogUserSuccess extends BlogUserState {
  final BLogUserModel blogsUser;
  const BlogUserSuccess({required this.blogsUser});
  @override
  List<Object> get props => [blogsUser];
  @override
  String toString() => 'BlogUserSuccess { blogs: $blogsUser }';
}
