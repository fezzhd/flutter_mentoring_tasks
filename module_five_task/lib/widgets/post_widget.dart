import 'package:flutter/material.dart';
import 'package:module_five_task/core/services/posts/models/post.dart';

class PostWidget extends StatelessWidget{
  final Post post;

  PostWidget({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                text: "${post.id.toString()}.",
                style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: post.title,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.normal)
                  )
                ]
            )
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(post.body)
          )
        ],
      ),
    );
  }
}