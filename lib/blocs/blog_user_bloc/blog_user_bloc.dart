import 'package:blog_app/blocs/blog_user_bloc/blog_user_event.dart';
import 'package:blog_app/blocs/blog_user_bloc/blog_user_state.dart';
import 'package:blog_app/repositories/blog_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogUserBloc extends Bloc<BlogUserEvent, BlogUserState> {
  final BlogRepository _blogRepository;
  BlogUserBloc({required BlogRepository blogRepository})
      : _blogRepository = blogRepository,
        super(BlogUserInitial()) {
    on<GetBlogsUser>(_getBlogsUser);
  }

  void _getBlogsUser(GetBlogsUser event, Emitter<BlogUserState> emit) async {
    emit(BlogUserLoading());
    try {
      final res = await _blogRepository.getBlogsUser(event.id);
      emit(BlogUserSuccess(blogsUser: res));
    } catch (e) {
      emit(BlogUserFailure());
    }
  }
}
