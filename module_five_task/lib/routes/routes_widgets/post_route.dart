import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:module_five_task/core/services/posts/models/post.dart';
import 'package:module_five_task/core/view_models/post_view_model.dart';
import 'package:module_five_task/generated/l10n.dart';
import 'package:module_five_task/widgets/post_widget.dart';

class PostRoute extends StatefulWidget{

  @override
  _PostRouteState createState() => _PostRouteState();
}

class _PostRouteState extends State<PostRoute> {

  final GetIt locator = GetIt.instance;
  PostViewModel _postViewModel;

  @override
  void initState() {
    super.initState();
    _postViewModel = locator.get<PostViewModel>();
  }

  @override
  void dispose() {
    _postViewModel.postObservable.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.of(context).mainRouteTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => _postViewModel.navigateToSettings(),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                StreamBuilder<Post>(
                  stream: _postViewModel.postObservable,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData){
                      return Text(AppLocalization.of(context).noPost);
                    } else {
                      return PostWidget(post: snapshot.data);
                    }
                  },
                ),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  child: Text(AppLocalization.of(context).selectPostTitle),
                  onPressed: () => _postViewModel.getPostFromList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}