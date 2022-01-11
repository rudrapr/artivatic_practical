import 'package:artivatic_practical/console.dart';
import 'package:artivatic_practical/home/models/post_model.dart';
import 'package:dio/dio.dart';

class PostService {
  final Dio _dio = Dio();

  Future<List<PostModel>> getPosts() async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var res = await _dio.getUri(uri);
    Console.log(res.statusCode);
    Console.log(res.data);
    if (res.statusCode == 200) {
      return res.data
          .map<PostModel>((json) => PostModel.fromJson(json))
          .toList();
    } else {
      throw Exception(res.statusMessage);
    }
  }
}
