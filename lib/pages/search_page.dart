import 'package:blog_app/blocs/search_bloc/search_bloc.dart';
import 'package:blog_app/blocs/search_bloc/search_event.dart';
import 'package:blog_app/blocs/search_bloc/search_state.dart';
import 'package:blog_app/constants/color_constants.dart';
import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/repositories/search_repository.dart';
import 'package:blog_app/widgets/common/item_blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final SearchRepository searchRepository = SearchRepository();
    return BlocProvider(
      create: (context) => SearchBloc(searchRepository: searchRepository),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: TextField(
                  controller: _searchController,
                  // autofocus: true,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Search',
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
                      child: IconButton(
                        onPressed: () {
                          if(_searchController.text.length < 2) {
                          } else {
                            context.read<SearchBloc>().add(SearchBlog(title: _searchController.text));
                          }
                        },
                        icon: Icon(
                          Icons.search,
                          color: ColorPalette.primaryColor.withOpacity(.5),
                        ),
                      ),
                    ),
                  ),
                )),
          ),
          body: SafeArea(
            child: BlocBuilder<SearchBloc, SearchBlogState>(
              builder: (context, searchState) {
                if (searchState is SearchBlogLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (searchState is SearchBlogSuccess) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding, vertical: 10),
                    child: ListView.builder(
                      itemCount: searchState.blogs.length,
                      itemBuilder: (context, index) {
                        return ItemBlog(
                          blog: searchState.blogs[index],
                        );
                      },
                    ),
                  );
                }
                return Container();
              },
            ),
          )),
    );
  }
}
