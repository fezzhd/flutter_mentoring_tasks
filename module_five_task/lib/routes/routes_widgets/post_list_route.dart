import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:module_five_task/core/services/posts/models/post.dart';
import 'package:module_five_task/core/view_models/post_list_view_model.dart';
import 'package:module_five_task/generated/l10n.dart';
import 'package:module_five_task/widgets/post_widget.dart';

class PostListRoute extends StatefulWidget{
  @override
  _PostListRouteState createState() => _PostListRouteState();
}

class _PostListRouteState extends State<PostListRoute> {

  PostListViewModel _postListViewModel;

  @override
  void initState() {
    super.initState();
    
    _postListViewModel = GetIt.instance.get<PostListViewModel>();
  }
  
  @override
  void dispose() {
    _postListViewModel.postObservable.close();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.of(context).selectPostTitle)
      ),
      body: SafeArea(
        bottom: false,
        child: StreamBuilder<List<Post>>(
          stream: _postListViewModel.postObservable.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator()
              );
            } else {
              return RefreshIndicator(
                child: ListView.builder(
                  itemBuilder: (context, itemIndex) =>
                    GestureDetector(
                      child: PostWidget(post: snapshot.data[itemIndex]),
                      onTap: () => _postListViewModel.navigateBackWithPost(snapshot.data[itemIndex])),
                  itemCount: snapshot.data.length,
                ),
                onRefresh: _postListViewModel.updateList,
              );
            }
          },
        ),
      ),
    );
  }
}