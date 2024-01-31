import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pracrestapi/model/UserModel.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<UserModel> userList = [];

  Future<List<UserModel>> getUserApi() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 390,
                        height: 300,
                      ),
                      CircularProgressIndicator(),
                      Text("Loading"),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 80,
                        child: Card(
                          child: Column(
                            children: [userView(snapshot, index)],
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

  Row userView(AsyncSnapshot<List<UserModel>> snapshot, int index) {
    return Row(
      children: [
        Text(snapshot.data![index].id.toString()),
        SizedBox(width: 8),
        Text(snapshot.data![index].name.toString()),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            snapshot.data![index].address!.city.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 8),
        Text(snapshot.data![index].address!.geo!.lat.toString()),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            snapshot.data![index].email!.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
