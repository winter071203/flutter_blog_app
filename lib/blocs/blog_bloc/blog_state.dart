import 'package:blog_app/models/home_blog_model.dart';
import 'package:equatable/equatable.dart';

abstract class BlogState extends Equatable {
  const BlogState();
  @override
  List<Object> get props => [];
}

class BlogInitial extends BlogState {}

class BlogLoading extends BlogState {}

class BlogFailure extends BlogState {}

class BlogSuccess extends BlogState {
  final List<HomeBlogModel> blogs;
  const BlogSuccess({required this.blogs});
  @override
  List<Object> get props => [blogs];
  @override
  String toString() => 'BlogSuccess { blogs: $blogs }';
}


