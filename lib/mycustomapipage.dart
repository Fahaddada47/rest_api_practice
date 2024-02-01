import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as htttp;
import 'package:pracrestapi/model/MyCustomApi.dart';

class MyCustomApiPage extends StatefulWidget {
  const MyCustomApiPage({super.key});

  @override
  State<MyCustomApiPage> createState() => _MyCustomApiPageState();
}

class _MyCustomApiPageState extends State<MyCustomApiPage> {
  List<MyCustomApi> mycustomapiList = [];
  String errorMessage = '';

  Future<void> getMyApi() async {
    try {
      final response = await htttp.get(Uri.parse("https://webhook.site/58916397-63a8-4c65-9650-89850e8d01a3"));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data is List) {
          mycustomapiList.clear(); // Clear the list before adding new data

          for (Map<String, dynamic> i in data) {
            try {
              mycustomapiList.add(MyCustomApi.fromJson(i));
            } catch (e) {
              print("Error parsing data: $e");
              print("Invalid data: $i");
              errorMessage = "Error parsing data: $e\nInvalid data: $i";
            }
          }
        } else {
          throw Exception("Invalid data format: $data");
        }
      } else {
        throw Exception("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
      errorMessage = "Error: $e";
      print(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Custom API LIST'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<void>(
              future: getMyApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Error Occurred"),
                        Text(errorMessage),
                      ],
                    ),
                  );
                } else {
                  return
                    ListView.builder(
                    itemCount: mycustomapiList.length,
                    itemBuilder: (context, index) {
                      var user = mycustomapiList[index].users![1]; // Assuming you want the first user
                      return
                          Column(
                            children: [
                              TextButton(onPressed: (){}, child: Text('Hello')),
                              Text("User ID: ${user.id}"),
                              Text("Username: ${user.username}"),
                              // Add more fields as needed
                            ],

                        );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

