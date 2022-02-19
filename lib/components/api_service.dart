import 'dart:convert';
import 'api.dart';
import 'package:http/http.dart' as http;

String tr =
    "https://newsapi.org/v2/top-headlines?country=tr&apiKey=14c0be07ee124612a104f2ce3fba8c64";

String trBusiness =
    "https://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=14c0be07ee124612a104f2ce3fba8c64";

String trEntertainment =
    "https://newsapi.org/v2/top-headlines?country=tr&category=entertainment&apiKey=14c0be07ee124612a104f2ce3fba8c64";

Future<Welcome> trapi() async {
  final response = await http.get(Uri.parse(tr));
  if (response.statusCode == 200) {
    return Welcome.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

Future<Welcome> trbusinessapi() async {
  final response = await http.get(Uri.parse(trBusiness));
  if (response.statusCode == 200) {
    return Welcome.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

Future<Welcome> trentertainment() async {
  final response = await http.get(Uri.parse(trBusiness));
  if (response.statusCode == 200) {
    return Welcome.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}
