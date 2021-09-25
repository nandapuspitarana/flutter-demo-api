import 'dart:convert';
import 'package:http/http.dart' as http;

class PostResult {
  String id = "";
  String name = "";
  String job = "";
  String crated = "";

  PostResult({this.id = "", this.name = "", this.job = "", this.crated = ""});

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
        id: object["id"],
        name: object["name"],
        job: object["job"],
        crated: object["createdAt"]);
  }

  static Future<PostResult> connectToApi(String name, String job) async {
    var client = http.Client();
    String apiUrl = "https://reqres.in/api/users";

    var apiResult =
        await client.post(Uri.parse(apiUrl), body: {"name": name, "job": job});

    var jsonObject = json.decode(apiResult.body);

    return PostResult.createPostResult(jsonObject);
  }
}
