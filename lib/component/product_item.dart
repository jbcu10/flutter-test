import 'package:flutter/material.dart';
import 'package:todo/model/post.dart';
import 'package:todo/utils/image_url.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductItem extends StatelessWidget {
  ProductItem({this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    print("images: ${post.images }");
    return new Container(
        padding: const EdgeInsets.only(
              top: 10.0, left: 10.0, right: 10.0),
        child: Column(
          children: <Widget>[
            new Image(
              image: new CachedNetworkImageProvider(
                  ImageUrl.translate(post.images )),
              height: 165.0,
            ),
            //IconButton(icon: Icon(Icons.map)),
          ],
        ));
  }
}
