

import 'package:equatable/equatable.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class CommentEventFetch extends CommentEvent {
  final String id;
  const CommentEventFetch({required this.id});

  @override
  List<Object> get props => [id];
}

class CreateComment extends CommentEvent {
  final String blogId;
  final String blogUserId;
  final dynamic content;
  final String token;
  const CreateComment(
      {required this.blogId, required this.blogUserId, required this.content, required this.token});
  @override
  List<Object> get props => [blogId, blogUserId, content, token];
  @override
  String toString() =>
      'CreateComment { blogId: $blogId, blogUserId: $blogUserId, content: $content, token: $token }';
}