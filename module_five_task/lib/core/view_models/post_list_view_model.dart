import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:module_five_task/core/services/app_services/navigation_service.dart';
import 'package:module_five_task/core/services/posts/models/post.dart';
import 'package:module_five_task/core/services/posts/post_service.dart';
import 'package:module_five_task/core/view_models/view_model_mixin.dart';

class PostListViewModel with ViewModelMixin {

  PostService _postService;
  NavigationService _navigationService;
  final PublishSubject<List<Post>> postObservable = PublishSubject();

  PostListViewModel(){
    _navigationService = locator.get<NavigationService>();
    _postService = locator.get<PostService>();
    postObservable.addStream(Stream.fromFuture(_postService.getPosts()));
  }

  void back(){
    _navigateBack();
  }

  void navigateBackWithPost(Post post){
    _navigateBack(post: post);
  }

  Future updateList() async{
    var newPosts = await _postService.getPosts();
    postObservable.add(newPosts);
  }

  void _navigateBack({Post post}){
    _navigationService.navigateBack(result: post);
  }
}