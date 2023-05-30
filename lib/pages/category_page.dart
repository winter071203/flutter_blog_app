import 'package:blog_app/blocs/category_bloc/category_bloc.dart';
import 'package:blog_app/blocs/category_bloc/category_event.dart';
import 'package:blog_app/blocs/category_bloc/category_state.dart';
import 'package:blog_app/constants/color_constants.dart';
import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/models/category_model.dart';
import 'package:blog_app/repositories/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final TextEditingController _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final CategoryRepository categoryRepository = CategoryRepository();
    return BlocProvider(
      create: (context) => CategoryBloc(categoryRepository: categoryRepository)
        ..add(CategoryFetched()),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: TextField(
                  controller: _categoryController,
                  // autofocus: true,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Add Category',
                    filled: true,
                    fillColor: ColorPalette.primaryColor.withOpacity(.2),
                    hintStyle: TextStyle(
                      color: ColorPalette.primaryColor.withOpacity(.5),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(36),
                    ),
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                        color: ColorPalette.primaryColor.withOpacity(.2),
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: BlocBuilder<CategoryBloc, CategoryState>(
                        builder: (context, categoryState) {
                          if (categoryState is CategoryLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (categoryState is CategorySuccess) {
                            return IconButton(
                              onPressed: () async {
                                final Future<SharedPreferences> _prefs =
                                    SharedPreferences.getInstance();
                                final SharedPreferences prefs = await _prefs;
                                final String? accessToken =
                                    prefs.getString('accessToken');
                                BlocProvider.of<CategoryBloc>(context).add(
                                    AddCategory(
                                        nameCategory: _categoryController.text,
                                        token: accessToken!,
                                        currentCategories: categoryState.categories
                                        ));
                              },
                              icon: Icon(
                                Icons.add,
                                color: ColorPalette.primaryColor
                                    .withOpacity(.5),
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                  ),
                )),
          ),
          body: SafeArea(
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, categoryState) {
                if (categoryState is CategoryLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (categoryState is CategorySuccess) {
                  return Container(
                    margin: const EdgeInsets.only(top: kDefaultPadding),
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: ListView.builder(
                      itemCount: categoryState.categories.length,
                      itemBuilder: (context, index) {
                        return _buildCategoryItem(
                            context,
                            categoryState.categories[index],
                            categoryState.categories);
                      },
                    ),
                  );
                }
                return Container(
                  child: Text('Error'),
                );
              },
            ),
          )),
    );
  }

  Widget _buildCategoryItem(BuildContext context, CategoryModel category,
      List<CategoryModel> categories) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding),
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          color: ColorPalette.primaryColor.withOpacity(.2),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            category.name![0].toUpperCase() + category.name!.substring(1),
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                ),
              ),
              IconButton(
                onPressed: () async {
                  final Future<SharedPreferences> _prefs =
                      SharedPreferences.getInstance();
                  final SharedPreferences prefs = await _prefs;
                  final String? accessToken = prefs.getString('accessToken');
                  BlocProvider.of<CategoryBloc>(context).add(DeleteCategory(
                      id: category.sId!,
                      token: accessToken!,
                      currentCategories: categories));
                },
                icon: Icon(
                  Icons.delete,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
