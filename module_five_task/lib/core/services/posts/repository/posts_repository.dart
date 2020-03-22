
import 'package:module_five_task/core/services/posts/models/post.dart';

abstract class PostsRepository {

  Future<List<Post>> getPosts() async{
  }
}