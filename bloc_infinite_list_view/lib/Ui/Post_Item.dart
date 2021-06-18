import 'package:bloc_infinite_list_view/Model/Post.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({Key? key, this.post}) : super(key: key);

  final Post? post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(post!.id),
          Container(
            width: (MediaQuery.of(context).size.width - 40) * 7 / 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post!.title),
                SizedBox(
                  height: 5.0,
                ),
                Text(post!.body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
