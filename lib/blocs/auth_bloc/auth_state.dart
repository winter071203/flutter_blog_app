


import 'package:blog_app/models/auth_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}
class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthFailure extends AuthState {}
class AuthSuccess extends AuthState {
  final AuthModel authModel;
  const AuthSuccess({required this.authModel});
  @override
  List<Object?> get props => [authModel];
  @override
  String toString() => 'AuthSuccess { authModel: $authModel }';
}