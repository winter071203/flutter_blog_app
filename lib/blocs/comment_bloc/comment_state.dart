

import 'package:blog_app/models/comment_model.dart';

abstract class CommentState {
  final List<CommentModel>? comments;
  const CommentState({this.comments});

  @override
  List<Object> get props => [];
}

class CommentInitial extends CommentState {}
class CommentLoading extends CommentState {}
class CommentFailure extends CommentState {}
class CommentSuccess extends CommentState {
  final List<CommentModel> listComment;
  const CommentSuccess({required this.listComment}):super(comments: listComment);

  @override
  List<Object> get props => [listComment];
  @override
  String toString() => 'CommentSuccess { comments: $listComment }';
}

class CreateCommentSuccess extends CommentState {
final List<CommentModel> listComment;
const CreateCommentSuccess({required this.listComment}): super(comments: listComment);
  @override
  List<Object> get props => [listComment];
  @override
  String toString() => 'CreateCommentSuccess { comments: $listComment }';
}