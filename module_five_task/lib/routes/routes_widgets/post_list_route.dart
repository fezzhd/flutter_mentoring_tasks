
import 'package:flutter/material.dart';
import 'package:module_five_task/core/services/posts/models/post.dart';
import 'package:module_five_task/widgets/post_widget.dart';

class PostListRoute extends StatefulWidget{
  @override
  _PostListRouteState createState() => _PostListRouteState();
}

class _PostListRouteState extends State<PostListRoute> { // todo init view model
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: FutureBuilder<List<Post>>(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator()
              );
            } else{
              return ListView.builder(
                itemBuilder: (context, itemIndex) => PostWidget(post: snapshot.data[itemIndex]),
                itemCount: snapshot.data.length,
              );
            }
          },
        ),
      ),
    );
  }
}