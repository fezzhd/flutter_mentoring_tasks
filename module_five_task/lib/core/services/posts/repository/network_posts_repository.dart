import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:module_five_task/core/base/base_http_service.dart';
import 'package:module_five_task/core/services/posts/exceptions/failed_retrieve_posts_exception.dart';
import 'package:module_five_task/core/services/posts/models/post.dart';
import 'package:module_five_task/core/services/posts/repository/posts_repository.dart';

class PostsNetworkRepository with HttpService implements PostsRepository{
  
  @override
  Future<List<Post>> getPosts() async {
    var postsRequestResult = await getRequest("https://jsonplaceholder.typicode.com/posts");
    if (postsRequestResult.statusCode == 200){
      return await compute(_decodePostsList, postsRequestResult.body);
    } else {
      throw FailedRetrievePostsException(postsRequestResult.statusCode, "Something went wrong");
    }
  }

  List<Post> _decodePostsList(String bodyString){
    Iterable postsJsonList = json.decode(bodyString);
    return postsJsonList.map((e) => Post.fromJson(e)).toList();
  }
}