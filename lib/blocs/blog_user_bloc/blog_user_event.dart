import 'package:equatable/equatable.dart';

abstract class BlogUserEvent extends Equatable {
  const BlogUserEvent();
  @override
  List<Object> get props => [];
}

class GetBlogsUser extends BlogUserEvent {
  final String id;
  const GetBlogsUser({required this.id});
  @override
  List<Object> get props => [id];
  @override
  String toString() => 'GetBlogsUser { id: $id }';  
}
