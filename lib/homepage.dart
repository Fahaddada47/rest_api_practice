import 'dart:convert';
import 'package:flutter/material.dart';
import 'model/PostsModel.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostsModel> postList = [];

  Future<List<PostsModel>> getPostApi() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REST API"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading");
                } else {
                  return ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index) {
                        // return Text(index.toString());
                        // return Text(postList[index].title.toString());
                        return Card(
                          child: Column(
                            children: [
                          Text(postList[index].title.toString(),
                          style: TextStyle(fontWeight: FontWeight.w700),),
                              Text(postList[index].body.toString()),

                            ],
                          ),
                        );

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
