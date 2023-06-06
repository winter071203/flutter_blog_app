

import 'package:blog_app/blocs/comment_bloc/comment_event.dart';
import 'package:blog_app/blocs/comment_bloc/comment_state.dart';
import 'package:blog_app/repositories/comment_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository _commentRepository;
  CommentBloc({required CommentRepository commentRepository}):
  _commentRepository = commentRepository,
  super(CommentInitial()) {
    on<CommentEventFetch>(_getComments);
  }

  void _getComments(CommentEventFetch event, Emitter<CommentState> emit) async {
    emit(CommentLoading());
    try {
      final res = await _commentRepository.getComments(event.id);
      emit(CommentSuccess(comments: res));
    } catch(e) {  
      emit(CommentFailure());
    }
  }
}