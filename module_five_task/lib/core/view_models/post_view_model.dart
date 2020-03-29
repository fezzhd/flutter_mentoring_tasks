import 'package:module_five_task/core/services/posts/models/post.dart';
import 'package:rxdart/rxdart.dart';
import 'package:get_it/get_it.dart';
import 'package:module_five_task/core/services/navigation_service.dart';
import '../consts/routes_paths.dart' as RoutesPaths;

class PostViewModel {

  final _getIt = GetIt.instance;
  final PublishSubject<Post> postObservable = PublishSubject<Post>();
  NavigationService _navigationService;

  PostViewModel(){
    _navigationService = _getIt.get<NavigationService>();
  }

  Future getPostFromList() async{
    var post = await _navigationService.pushRoute(RoutesPaths.listPostRoute);
    if ((post != null) && (post is Post)){
      postObservable.sink.add(post);
    }
  }
}