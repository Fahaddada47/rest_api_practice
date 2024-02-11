import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pracrestapi/model/MyApiModel.dart';

// List<MyApiModel> productList = [];

Future<MyApiModel> getApi() async {
  // productList.clear();
  final response = await http.get(
    Uri.parse("https://mocki.io/v1/e3f50f05-090a-45bc-8f94-fac691f03df0"),
  );
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    return MyApiModel.fromJson(data);
  } else {
    return MyApiModel.fromJson(data);
  }
}
