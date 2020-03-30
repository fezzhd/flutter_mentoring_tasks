
import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:module_five_task/core/services/navigation_service.dart';
import 'package:module_five_task/core/services/posts/models/post.dart';
import 'package:module_five_task/core/services/posts/post_service.dart';
import 'package:rxdart/rxdart.dart';

class PostListViewModel{
  PostService _postService;
  NavigationService _navigationService;
  final PublishSubject<List<Post>> postObservable = PublishSubject();


  PostListViewModel(){
    var locator = GetIt.instance;
    _navigationService = locator.get<NavigationService>();
    _postService = locator.get<PostService>();
    postObservable.addStream(Stream.fromFuture(_postService.getPosts()));
  }

  void back(){
    _navigateBack(null);
  }

  void navigateBackWithPost(Post post){
    _navigateBack(post);
  }

  Future updateList() async{
    var newPosts = await _postService.getPosts();
    postObservable.add(newPosts);
  }

  void _navigateBack(Post post){
    _navigationService.navigateBack(result: post);
  }
}