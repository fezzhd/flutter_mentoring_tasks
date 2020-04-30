import 'package:module_five_task/core/shared/disposable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:module_five_task/core/services/posts/models/post.dart';
import 'package:module_five_task/core/view_models/view_model_mixin.dart';
import 'package:module_five_task/core/services/app_services/navigation_service.dart';
import '../consts/routes_paths.dart' as RoutesPaths;

class PostViewModel with ViewModelMixin implements Disposable {

  final PublishSubject<Post> postObservable = PublishSubject<Post>();
  NavigationService _navigationService;

  PostViewModel(){
    _navigationService = locator.get<NavigationService>();
  }

  Future getPostFromList() async{
    var post = await _navigationService.pushRoute(RoutesPaths.listPostRoute);
    if ((post != null) && (post is Post)){
      postObservable.sink.add(post);
    }
  }

  void navigateToSettings(){
    _navigationService.pushRoute(RoutesPaths.settingsRoute);
  }

  @override
  void dispose() {
    postObservable.close();
  }
}