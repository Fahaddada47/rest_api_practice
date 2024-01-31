import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhotosList extends StatefulWidget {
  const PhotosList({super.key});

  @override
  State<PhotosList> createState() => _PhotosListState();
}

class _PhotosListState extends State<PhotosList> {
  List<Photos> photosList = [];

  Future<List<Photos>> getPhotosApi() async {
    final respnse = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(respnse.body.toString());

    if (respnse.statusCode == 200) {
      for (Map i in data) {
        Photos photos = Photos(
            title: i['title'],
            url: i['url']);
        photosList.add(photos);
      }
      return photosList;
    } else {
      return photosList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photos List"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotosApi(),
                builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
                  return ListView.builder(
                      itemCount: photosList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data! [index].title.toString()),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}

class Photos {
  String title, url;

  Photos({required this.title, required this.url});
}
