import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  int? id;
  String? name;

  User({this.id, this.name});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
        id: object["id"],
        name: object["first_name"] + " " + object["last_name"]);
  }

  static Future<User> connectToApi(String id) async {
    var client = http.Client();

    String apiUrl = "https://reqres.in/api/users/" + id;

    var apiResult = await client.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)["data"];

    return User.createUser(userData);
  }
}
