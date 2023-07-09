import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}
class AuthEventLogin extends AuthEvent {
  final String account;
  final String password;
  const AuthEventLogin({required this.account, required this.password});
  @override
  List<Object?> get props => [account, password];
  @override
  String toString() => 'AuthEventLogin { account: $account, password: $password }';
}


class AuthEventRegister extends AuthEvent {
  final String account;
  final String password;
  const AuthEventRegister({required this.account, required this.password});
  @override
  List<Object?> get props => [account, password];
  @override
  String toString() => 'AuthEventRegister { account: $account, password: $password }';
}

class AuthEventRefreshToken extends AuthEvent {
  final String refreshToken;
  const AuthEventRefreshToken({required this.refreshToken});
  @override
  List<Object?> get props => [refreshToken];
  @override
  String toString() => 'AuthEventRefreshToken { refreshToken: $refreshToken }';
}

class AuthEventLogout extends AuthEvent {}