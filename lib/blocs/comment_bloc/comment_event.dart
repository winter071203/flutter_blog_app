

import 'package:equatable/equatable.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class CommentEventFetch extends CommentEvent {
  final String id;
  const CommentEventFetch({required this.id});

  @override
  List<Object> get props => [id];
}