import 'package:blog_app/models/category_model.dart';
import 'package:equatable/equatable.dart';

class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class CategoryFetched extends CategoryEvent {}

class DeleteCategory extends CategoryEvent {
  final List<CategoryModel> currentCategories;
  final String token;
  final String id;
  const DeleteCategory(
      {required this.id, required this.currentCategories, required this.token});
  @override
  List<Object> get props => [id, currentCategories, token];
  @override
  String toString() => 'DeleteCategory { id: $id }';
}

class AddCategory extends CategoryEvent {
    final List<CategoryModel> currentCategories;
  final String nameCategory;
  final String token;
  const AddCategory({required this.nameCategory, required this.token, required this.currentCategories});
  @override
  List<Object> get props => [nameCategory, token, currentCategories];
  @override
  String toString() => 'AddCategory { nameCategory: $nameCategory }';
}
