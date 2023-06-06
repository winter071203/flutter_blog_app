


import 'dart:io';

import 'package:blog_app/blocs/category_bloc/category_bloc.dart';
import 'package:blog_app/blocs/category_bloc/category_event.dart';
import 'package:blog_app/blocs/category_bloc/category_state.dart';
import 'package:blog_app/constants/color_constants.dart';
import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/helpers/image_helper.dart';
import 'package:blog_app/models/category_model.dart';
import 'package:blog_app/repositories/category_repository.dart';
import 'package:blog_app/widgets/common/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddBlogPage extends StatefulWidget {
  static const String routeName = '/add_blog_page';
  const AddBlogPage({super.key});

  @override
  State<AddBlogPage> createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
    File? image;
    Future pickImage(ImageSource soure) async {
    try {
      final image = await ImagePicker().pickImage(source: soure);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('pickImage error: $e');
    }
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceBetween,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          title: Text("Choose option?"),
          actions: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    ColorPalette.primaryColor),
                
              ),
              child: Row(
                children: const [
                  Icon(FontAwesomeIcons.camera),
                  SizedBox(width: kDefaultPadding),
                  Text("Camera"),
                ],
              ),
              onPressed: () {
                pickImage(ImageSource.camera);
                Navigator.of(context).pop();
              },
            ),
              ElevatedButton(
              child: Row(
                children: const [
                  Icon(FontAwesomeIcons.image),
                  SizedBox(width: kDefaultPadding),
                  Text("Gallery"),
                ],
              ),
              onPressed: () {
                pickImage(ImageSource.gallery);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final CategoryRepository _categoryRepository = CategoryRepository();
    return BlocProvider(
      create: (context) => CategoryBloc(categoryRepository: _categoryRepository)..add(CategoryFetched()),
      child: Scaffold(
        appBar: AppBar( 
          backgroundColor: ColorPalette.primaryColor,
          title: Text('Add Blog'),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: SingleChildScrollView(
            child: Column( 
              children: [
                Padding(padding: EdgeInsets.only(top: kDefaultPadding)),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                    hintText: 'Add a title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kMediumPadding),
                    ),
                  ),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                // Get Image from galler or camera
                GestureDetector(
                  onTap: () {
                    _showDialog(context);
                  },
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(kMediumPadding),
                    ),
                    child: image == null
                        ? Center(
                            child: Text('No Image'),
                          )
                        : ImageHelper.loadImageFile(image!)
                  ),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                // Description
                TextFormField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'Add a description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kMediumPadding),
                    ),
                  ),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                // Select Category
                BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, categoryState) {
                    if(categoryState is CategoryLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if(categoryState is CategorySuccess) {
                      return _buildSelectCategory(categoryState.categories);
                    } 
                    return Center(
                      child: Text('Error'));
                  },
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                // Text Area content
                TextFormField(
                  maxLines: 20,
                  decoration: InputDecoration(
                    labelText: 'Content',
                    hintText: 'Add a content',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kMediumPadding),
                    ),
                  ),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                ButtonWidget(title: 'Create Post', onPressed: () {
                  
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectCategory(List<CategoryModel> listCategory) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listCategory.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: kMediumPadding),
            child: ChoiceChip(
              label: Text(listCategory[index].name as String),
              selected: false,
              onSelected: (value) {},
            ),
          );
        },
      ),
    );
  }
}