import 'package:blog_app/blocs/category_bloc/category_event.dart';
import 'package:blog_app/blocs/category_bloc/category_state.dart';
import 'package:blog_app/models/category_model.dart';
import 'package:blog_app/repositories/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryInitial()) {
    on<CategoryFetched>(_getCategories);
    on<DeleteCategory>(_deleteCategory);
    on<AddCategory>(_addCategory);
  }
  void _getCategories(CategoryEvent event, Emitter<CategoryState> emit) async {
    if (event is CategoryFetched) {
      emit(CategoryLoading());
      try {
        final res = await _categoryRepository.getCategories();
        emit(CategorySuccess(categories: res));
      } catch (e) {
        emit(CategoryFailure());
      }
    }
  }

  void _deleteCategory(CategoryEvent event, Emitter<CategoryState> emit) async {
    if (event is DeleteCategory) {
      try {
        await _categoryRepository.deleteCategories(event.id, event.token);
        final List<CategoryModel> updatedCategories = event.currentCategories
            .where((element) => element.sId != event.id)
            .toList();
        emit(CategorySuccess(categories: updatedCategories));
      } catch (e) {
        emit(CategoryFailure());
      }
    }
  }

  void _addCategory(CategoryEvent event, Emitter<CategoryState> emit) async {
    if (event is AddCategory) {
      try {
        final res = await _categoryRepository.addCategory(
            event.nameCategory, event.token);
        
        final List<CategoryModel> updatedCategories = [
          ...event.currentCategories,
          res
        ];
        emit(CategorySuccess(categories: updatedCategories));
      } catch (e) {
        emit(CategoryFailure());
      }
    }
  }
}
