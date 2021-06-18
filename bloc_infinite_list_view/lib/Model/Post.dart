import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

class Post {
  String id, title, body;
  Post({required this.id, required this.title, required this.body});

  factory Post.createPost(Map<String, dynamic> object) {
    return Post(id: object["id"], title: object["title"], body: object["body"]);
  }

  static Future<List<Post>> connectToApi(int start, int limit) async {
    String apiUrl = "https://jsonplaceholder.typicode.com/posts?_start=" +
        start.toString() +
        "&_limit=" +
        limit.toString();

    var apiResult = await http.get(apiUrl);
    var jsonObject = json.decode(apiResult.body) as List;

    return jsonObject
        .map<Post>((item) => Post(
            id: item["id"].toString(),
            title: item["title"],
            body: item["body"]))
        .toList();
  }
}
