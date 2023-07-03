

import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
  @override
  List<Object?> get props => [];
}




class GetUserProfile extends UserEvent {
  final String id;
  const GetUserProfile(this.id);
  @override
  List<Object?> get props => [];
}
