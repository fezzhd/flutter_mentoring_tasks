import 'package:flutter/material.dart';
import 'package:module_five_task/core/services/posts/models/post.dart';

class PostView extends StatelessWidget{
  final Post post;

  PostView({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
              text: "${post.id.toString()}. ",
              style: TextStyle(fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: post.title
                )
              ]
          )
        ),
        Container(
            padding: const EdgeInsets.all(5),
            child: Text(post.body)
        )
      ],
    );
  }
}