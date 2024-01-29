import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pracrestapi/model/AlbumModel.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  List<AlbumModel> albumList = [];

  Future<List<AlbumModel>> getAlbumApi () async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));
     var data  = jsonDecode(response.body.toString());

     if (response.statusCode == 200){
       for (Map i in data){
         albumList.add(AlbumModel.fromJson(i));
       }
       return albumList;
     }
     else{
       return albumList;
     }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Album Page"),),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: getAlbumApi(), builder: (context , snapshot){
              if(!snapshot.hasData){
                return Text("Loading");
              }else{
                return ListView.builder(
                    itemCount: albumList.length,
                    itemBuilder: (context, index){
                      return Text(index.toString());
                    });
              }
            }),
          ),
        ],
      ),
    );
  }
}
