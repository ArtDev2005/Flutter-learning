import 'dart:convert';
import 'dart:io';

import 'package:flutter_learning/domain/entity/post.dart';

class ApiClient{
  final client = HttpClient();
  Future<List<Post>> getPosts() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    //Uri(scheme: "https", host: "jsonplaceholder.typicode.com", path: "posts");
    final request = await client.getUrl(url);
    final response = await request.close();
    final jsonStr = await response.transform(utf8.decoder).toList();
    final jsonJoinString = jsonStr.join();
    final json = jsonDecode(jsonJoinString) as List<dynamic>;
    final posts = json.map((dynamic e) => Post.fromJson(e as Map<String, dynamic>)).toList();
    return posts;
  }
}