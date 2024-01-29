import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pracrestapi/model/PhotosModel.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  List<PhotosModel> photosList = [];

  Future<List<PhotosModel>> getPhotosApi() async {
    final respnse = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(respnse.body.toString());

    if (respnse.statusCode == 200) {
      for (Map i in data) {
        photosList.add(PhotosModel.fromJson(i));
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
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading");
                } else {
                  return ListView.builder(
                    itemCount: photosList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 300, // Set the desired height
                        width: double.infinity, // Set the desired width
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            textDirection: TextDirection.ltr,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(photosList[index].url.toString()),
                                radius: 100,
                              ),
                              SizedBox(width: 8), // Add some spacing between CircleAvatar and Text widgets
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(index.toString()),
                                  Text(photosList[index].title.toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );

                }

              },
            ),
          ),
        ],
      ),
    );
  }
}
