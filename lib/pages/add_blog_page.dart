import 'dart:io';

import 'package:blog_app/blocs/category_bloc/category_bloc.dart';
import 'package:blog_app/blocs/category_bloc/category_event.dart';
import 'package:blog_app/blocs/category_bloc/category_state.dart';
import 'package:blog_app/constants/color_constants.dart';
import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/helpers/image_helper.dart';
import 'package:blog_app/models/category_model.dart';
import 'package:blog_app/repositories/blog_repository.dart';
import 'package:blog_app/repositories/category_repository.dart';
import 'package:blog_app/utils/image_upload.dart';
import 'package:blog_app/widgets/common/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddBlogPage extends StatefulWidget {
  static const String routeName = '/add_blog_page';
  const AddBlogPage({super.key});

  @override
  State<AddBlogPage> createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
  bool _isLoading = false;
  String? _categoryModel;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  quill.QuillController _controller = quill.QuillController.basic();
  int _categoryId = 0;
  File? image;
  Future pickImage(ImageSource soure) async {
    var image = await ImagePicker().pickImage(source: soure);
    if (image == null) return;
    setState(() {
      this.image = File(image.path);
    });
  }

  void createBlog() async {
    setState(() {
      _isLoading = true;
    });
    if(image == null) {
      Get.snackbar('Error', 'Please choose image', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    final imageLink = await imageUpload(image!);
    Map<String, dynamic> data = {
      'title': _titleController.text,
      'description': _descriptionController.text,
      'thumbnail': imageLink,
      'category': _categoryModel,
      'content': (_controller.document.toPlainText())
    };
    final BlogRepository _blogRepository = BlogRepository();
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final token = prefs.getString('accessToken');
    await _blogRepository.createBlog(data, token!);
    setState(() {
      _isLoading = false;
    });
    Get.snackbar('Success', 'Create blog success', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
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
        create: (context) =>
            CategoryBloc(categoryRepository: _categoryRepository)
              ..add(CategoryFetched()),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Add Blog'),
            automaticallyImplyLeading: false,
            actions: [
              // !_isLoading ? 
              IconButton(
                onPressed: () {
                  createBlog();
                },
                icon: Icon(Icons.check),
              ) 
              // :
              // CircularProgressIndicator()
            ],
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: kDefaultPadding)),
                  GestureDetector(
                    onTap: () {
                      _showDialog(context);
                      // pickImage(ImageSource.gallery);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(kMediumPadding),
                        ),
                        child: image == null
                            ?  
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.add_a_photo),
                                  Spacer(),
                                  Text('Add a photo', style: TextStyle(fontSize: 18)),
                                ],
                              )
                            : ImageHelper.loadImageFile(image!,
                                fit: BoxFit.cover, height: 200)),
                  ),
                  // Description
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                    children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: 'Add a title',
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  TextField(
                    maxLines: 10,
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      hintText: 'Add a description',
                    ),
                  ),
                    ],
                  )),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  // Select Category
                  BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, categoryState) {
                      if (categoryState is CategoryLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (categoryState is CategorySuccess) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Select Category',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: kDefaultPadding,
                            ),
                            _buildSelectCategory(categoryState.categories),
                          ],
                        );
                      }
                      return Center(child: Text('Error'));
                    },
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Create Content',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  quill.QuillToolbar.basic(controller: _controller, showInlineCode: true,),
                  quill.QuillEditor.basic(
                    controller: _controller,
                    readOnly: false, // true for view only mode
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  ButtonWidget(title: 'Create Post', onPressed: () {})
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildSelectCategory(List<CategoryModel> listCategory) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listCategory.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.transparent,
            margin: EdgeInsets.only(right: kMediumPadding),
            child: ChoiceChip(
              label: Text(listCategory[index].name![0].toUpperCase() +
                  listCategory[index].name!.substring(1)),
              selected: index == _categoryId,
              onSelected: (value) {
                setState(() {
                  _categoryModel = listCategory[index].sId;
                  _categoryId = index;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
