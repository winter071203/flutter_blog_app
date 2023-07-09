
import 'package:equatable/equatable.dart';

abstract class BlogEvent extends Equatable {
  const BlogEvent();
  @override
  List<Object> get props => [];
}


class FetchBlog extends BlogEvent {}

class FecthBlogUSer extends BlogEvent{
  final String userId;
  const FecthBlogUSer({required this.userId});
  @override
  List<Object> get props => [userId];
}

class CreateBlog extends BlogEvent {
  Map<String, dynamic> data;
  String token;
  CreateBlog({required this.data, required this.token});
  @override
  List<Object> get props => [data, token];
}