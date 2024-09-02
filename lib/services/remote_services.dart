import 'package:flutter_application_1/models/post_data.dart';
import "package:http/http.dart" as http;

class RemoteServices {
  Future<List<Post>?> getPosts() async {
    //This is juts a call to an API as a Future
    var client = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }else{
      return null;
    }
  }
}
