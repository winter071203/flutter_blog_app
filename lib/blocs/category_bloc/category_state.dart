import 'package:blog_app/models/category_model.dart';
import 'package:equatable/equatable.dart';

class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryModel> categories;
  const CategorySuccess({required this.categories});
  @override
  List<Object> get props => [categories];
  @override
  String toString() => 'CategorySuccess { categories: $categories }';
}


class CategoryFailure extends CategoryState {}
