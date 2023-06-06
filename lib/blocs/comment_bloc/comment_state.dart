

import 'package:blog_app/models/comment_model.dart';
import 'package:equatable/equatable.dart';

abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class CommentInitial extends CommentState {}
class CommentLoading extends CommentState {}
class CommentFailure extends CommentState {}
class CommentSuccess extends CommentState {
  final List<CommentModel> comments;
  const CommentSuccess({required this.comments});

  @override
  List<Object> get props => [comments];
  @override
  String toString() => 'CommentSuccess { comments: $comments }';
}