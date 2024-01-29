import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pracrestapi/model/CommentsModel.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<CommentsModel> commentList = [];

  Future<List<CommentsModel>> getCommentApi() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        commentList.add(CommentsModel.fromJson(i));
      }
      return commentList;
    } else {
      return commentList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getCommentApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading");
                } else {
                  return ListView.builder(
                      itemCount: commentList.length,
                      itemBuilder: (context, index) {
                        return Text(index.toString());
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
