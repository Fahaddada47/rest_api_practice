import 'package:flutter/material.dart';
import 'package:pracrestapi/albumpage.dart';
import 'package:pracrestapi/comment_page.dart';
import 'package:pracrestapi/homepage.dart';
import 'package:http/http.dart' as http;
import 'package:pracrestapi/photoslist.dart';
import 'package:pracrestapi/photospage.dart';
import 'package:pracrestapi/userpage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserPage(),
    );
  }
}
