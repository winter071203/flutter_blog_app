import 'package:blog_app/blocs/auth_bloc/auth_event.dart';
import 'package:blog_app/blocs/auth_bloc/auth_state.dart';
import 'package:blog_app/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc({required AuthRepository authRepository})
      :_authRepository = authRepository,
        super(AuthInitial()) {
    on<AuthEvent>((AuthEvent event, Emitter<AuthState> emit) async {
      final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;
      if (event is AuthEventLogout) {
        prefs.remove('accessToken');
        prefs.remove('refreshToken');
      } else if (event is AuthEventLogin) {
        emit(AuthLoading());
        try {
          final res =
              await _authRepository.login(event.account, event.password) ;
          prefs.setString('accessToken', res.accessToken);
          prefs.setString('refreshToken', res.refreshToken);
          emit(AuthSuccess(authModel: res));
        } catch (e) {
          prefs.remove('accessToken');
          prefs.remove('refreshToken');
        }
      }
    });
  }
}
