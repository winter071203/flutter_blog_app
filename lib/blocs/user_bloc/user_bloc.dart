

import 'package:blog_app/blocs/user_bloc/user_event.dart';
import 'package:blog_app/blocs/user_bloc/user_state.dart';
import 'package:blog_app/repositories/blog_repository.dart';
import 'package:blog_app/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  UserBloc({required UserRepository userRepository}):
  _userRepository = userRepository,
  super(GetUserInitial()){
    on<GetUserProfile>(_getUser);
  }

  void _getUser(GetUserProfile event, Emitter<UserState> emit) async {
    emit(GetUserLoading());
    try {
      // delay 1s
      await Future.delayed(Duration(milliseconds: 500));
      final res1 = await _userRepository.getUser(event.id);
      final res2 = await BlogRepository().getBlogsUser(event.id);
      emit(GetUserSuccess(user: res1, blogUser: res2));
    } catch (e) {
      emit(GetUserFailed());
    }
  }
}