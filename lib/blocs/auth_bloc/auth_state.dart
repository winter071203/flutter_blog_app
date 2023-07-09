


import 'package:blog_app/models/auth_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}
class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthFailure extends AuthState {
  final String msg;
  const AuthFailure({required this.msg});
  @override
  List<Object?> get props => [msg];
  @override
  String toString() => 'AuthFailure { msg: $msg }';

}
class AuthSuccess extends AuthState {
  final AuthModel authModel;
  const AuthSuccess({required this.authModel});
  @override
  List<Object?> get props => [authModel];
  @override
  String toString() => 'AuthSuccess { authModel: $authModel }';
}

class AuthLogout extends AuthState {
  final String msg;
  const AuthLogout({required this.msg});
  @override
  List<Object?> get props => [msg];
  @override
  String toString() => 'AuthLogout { msg: $msg }';
}