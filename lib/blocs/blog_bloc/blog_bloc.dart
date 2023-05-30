import 'package:blog_app/blocs/blog_bloc/blog_event.dart';
import 'package:blog_app/blocs/blog_bloc/blog_state.dart';
import 'package:blog_app/repositories/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final HomeRepository _homeRepository;
  BlogBloc({required HomeRepository homeRepository})
      : assert(homeRepository != null),
        _homeRepository = homeRepository,
        super(BlogInitial()) {
    on<BlogEvent>(_getHomeBlogs);
  }
  void _getHomeBlogs(BlogEvent event, Emitter<BlogState> emit) async {
    if (event is FetchBlog) {
      emit(BlogLoading());
      try {
        final res = await _homeRepository.getHomeBlogs();
        emit(BlogSuccess(blogs: res));
      } catch (e) {
        emit(BlogFailure());
      }
    }
  }
}
