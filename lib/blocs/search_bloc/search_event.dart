

import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
  @override
  List<Object> get props => [];
}

class SearchBlog extends SearchEvent {
  final String? title;
  const SearchBlog({required this.title});
  @override
  List<Object> get props => [title!];
}