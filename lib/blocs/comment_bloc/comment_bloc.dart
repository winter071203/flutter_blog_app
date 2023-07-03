

import 'package:blog_app/blocs/comment_bloc/comment_event.dart';
import 'package:blog_app/blocs/comment_bloc/comment_state.dart';
import 'package:blog_app/models/comment_model.dart';
import 'package:blog_app/repositories/comment_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository _commentRepository;
  CommentBloc({required CommentRepository commentRepository}):
  _commentRepository = commentRepository,
  super(CreateCommentSuccess(listComment: [])) {
    on<CommentEventFetch>(_getComments);
    on<CreateComment>(_createComment);
  }
  final List<CommentModel> _listComment = [];
  List<CommentModel> get items => _listComment;

  void _getComments(CommentEventFetch event, Emitter<CommentState> emit) async {
    emit(CommentLoading());
    try {
      final res = await _commentRepository.getComments(event.id);
      _listComment.addAll(res);
      emit(CommentSuccess(listComment: _listComment));
    } catch(e) {  
      emit(CommentFailure());
    }
  }

  void _createComment(CreateComment event, Emitter<CommentState> emit) async {
    try {
      final res = await _commentRepository.createComment(event.blogId, event.blogUserId, event.content, event.token);
      // add front list
      _listComment.insert(0, res);
      emit(CommentSuccess(listComment: _listComment));
    } catch(e) {
      emit(CommentFailure());
    }
  }
}