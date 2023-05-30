

import 'package:blog_app/models/blog_model.dart';
import 'package:equatable/equatable.dart';

abstract class SearchBlogState extends Equatable {
  const SearchBlogState();
  @override
  List<Object> get props => [];
}

class SearchBlogInitial extends SearchBlogState {}


class SearchBlogLoading extends SearchBlogState {}

class SearchBlogFailure extends SearchBlogState {}

class SearchBlogSuccess extends SearchBlogState {
  final List<BlogModel> blogs;
  const SearchBlogSuccess({required this.blogs});
  @override
  List<Object> get props => [blogs];
  @override
  String toString() => 'SearchBlogSuccess { blogs: $blogs }';
}