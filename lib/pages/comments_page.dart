import 'package:blog_app/blocs/comment_bloc/comment_bloc.dart';
import 'package:blog_app/blocs/comment_bloc/comment_event.dart';
import 'package:blog_app/blocs/comment_bloc/comment_state.dart';
import 'package:blog_app/constants/color_constants.dart';
import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/models/comment_model.dart';
import 'package:blog_app/repositories/comment_repository.dart';
import 'package:blog_app/utils/convert_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsPage extends StatefulWidget {
  static const String routeName = '/comments_page';
  final String id;
  final String blogUserId;
  final String token;
  const CommentsPage({super.key, required this.id,required this.blogUserId, required this.token});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {

  final TextEditingController _commentController = TextEditingController();
  

  void _showDialog(BuildContext context) {
    // user defined function void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          actions: <Widget>[
            
            TextButton(
              child: new Text("Report"),
              onPressed: () {
                // Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final CommentRepository _commentRepository = CommentRepository();
    return BlocProvider(
      create: (context) => CommentBloc(commentRepository: _commentRepository)
        ..add(CommentEventFetch(id: widget.id)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Comments'),
        ),
        body: BlocBuilder<CommentBloc, CommentState>(
          builder: (context, commentState) {
            if (commentState is CommentLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (commentState is CommentSuccess) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                    itemCount: commentState.comments?.length,
                    itemBuilder: (context, index) {
                      return _buildCommentItem(commentState.comments![index]);
                    },
                  )),
                  _buidlInputComment(context),
                ],
              );
            }
            return Center(
              child: Text('Error'),
            );
          },
        ),
      ),
    );
  }


  Widget _buildCommentItem(CommentModel comment) {
    return GestureDetector(
      onLongPress: () {
        _showDialog(context);
      },
      child: Container(
        alignment: Alignment.centerLeft,
        color: Colors.transparent,
        margin: EdgeInsets.only(top: kDefaultPadding),
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(comment.user!.avatar!),
            ),
            const SizedBox(
              width: kItemPadding,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment.user!.name!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    comment.content!.replaceAll('<p>', '').replaceAll('</p>', ''),
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      convertDate(comment.createdAt!),
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buidlInputComment(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: ColorPalette.primaryColor.withOpacity(.2),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kDefaultPadding),
            topRight: Radius.circular(kDefaultPadding)),
      ),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                controller: _commentController,
            decoration: InputDecoration(
                hintText: 'Add a comment...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kDefaultPadding),
                    borderSide: BorderSide.none)),
          )),
          const SizedBox(
            width: kItemPadding,
          ),
          IconButton(onPressed: () {
            context.read<CommentBloc>().add(CreateComment(blogId: widget.id, blogUserId: widget.blogUserId, content: '<p>${_commentController.text}</p>', token: widget.token));
            _commentController.clear();
          }, icon: Icon(Icons.send))
        ],
      ),
    );
  }
}
