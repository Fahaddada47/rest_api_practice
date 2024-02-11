import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pracrestapi/model/WishListModel.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  List<WishListModel> wishList = [];

  Future<List<WishListModel>> getWishApi() async {
    wishList.clear();
    final response = await http.get(
        Uri.parse("https://webhook.site/58916397-63a8-4c65-9650-89850e8d01a3"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        wishList.add(WishListModel.fromJson(i));
      }
      return wishList;
    } else {
      return wishList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wish List"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getWishApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text("Loading"),
                      ],
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: wishList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Card(
                              child: Column(
                            children: [
                              // Text(index.toString(),),
                              Text(wishList[index].id.toString()),
                              Text(wishList[index].productName.toString()),
                              Text(wishList[index].medicineType.toString()),
                              Text(wishList[index].availabilityType.toString()),
                              Text(wishList[index].sellingPrice.toString()),
                              Text(wishList[index].retailPrice.toString()),
                              CircleAvatar(
                                backgroundImage: NetworkImage(" wishList[index].img.toString()"),
                              ),
                                  // wishList[index].img.toString()),
                              Text(wishList[index].companyName.toString()),


                            ],
                          )),
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
