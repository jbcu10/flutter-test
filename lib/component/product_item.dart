import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo/model/post.dart';
import 'package:todo/utils/image_url.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductItem extends StatelessWidget {
  ProductItem({this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    print("images: ${post.images}");
    return new Padding(
        padding: new EdgeInsets.all(8.0),
        child: new GestureDetector(
          onTap: () {
            showDialog<Null>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return new AlertDialog(
                  title: new Text(post.title),
                  content: new SingleChildScrollView(
                    child: new ListBody(
                      children: <Widget>[
                        new Image(
                          image: new CachedNetworkImageProvider(
                              ImageUrl.translate(post.images)),
                        ),
                        Text(post.body)
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Padding(
                    padding: new EdgeInsets.all(8.0),
                    child: new Image(
                      image: new CachedNetworkImageProvider(
                          ImageUrl.translate(post.images)),
                      height: 180.0,
                    )),
                new ListTile(
                  title: Text(post.title),
                ),
                new ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: new ButtonBar(
                    children: <Widget>[
                      new FlatButton(
                        child: const Text('BUY TICKETS'),
                        onPressed: () {
                          /* ... */
                        },
                      ),
                      new FlatButton(
                        child: const Text('LISTEN'),
                        onPressed: () {
                          /* ... */
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
