import 'dart:math';

import 'package:flutter/material.dart';

import 'dart:html' as html;

import 'package:vc_flutter_blog_web/json/link_item_bean.dart';

class ItemPage extends StatefulWidget {
  final LinkItemBean bean;

  ItemPage(this.bean);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 380,
      margin: EdgeInsets.only(top: 50),
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 50),
            child: Card(
              child: Container(
                margin: EdgeInsets.only(top: 50),
                width: 250,
                height: 250,
                child: Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll) {
                      overScroll.disallowGlow();
                      return true;
                    },
                    child: ListView(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          child: Text(
                            '${widget.bean.linkName}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'huanwen_kt',
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Wrap(
                            children: List.generate(
                                widget.bean.linkDescription.length, (index) {
                              return Container(
                                margin: EdgeInsets.all(10),
                                child: Text(
                                  '${widget.bean.linkDescription[index]}',
                                  style: TextStyle(
                                    fontFamily: 'huawen_kt',
                                    fontSize:
                                        (Random().nextInt(10) + 15).toDouble(),
                                    color: Colors.primaries[Random()
                                        .nextInt(Colors.primaries.length)],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  image: DecorationImage(
                    image: NetworkImage(widget.bean.linkAvatar),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 300),
              child: FlatButton(
                onPressed: () {
                  html.window.open(widget.bean.linkAddress, widget.bean.linkName);
                },
                color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                child: Text(
                  '进入博客',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'huawen_kt',
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),

            ),
          ),
        ],
      ),
    );
  }
}
