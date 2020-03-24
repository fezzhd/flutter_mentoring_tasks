import 'package:module_five_task/core/services/posts/repository/network_posts_repository.dart';
import 'package:module_five_task/core/services/posts/repository/posts_repository.dart';
import 'models/post.dart';

class PostService {

  PostsRepository _postsRepository;

  PostService(){
    _postsRepository = PostsNetworkRepository();
  }

  Future<List<Post>> getPosts() {
    return _postsRepository.getPosts();
  }
}