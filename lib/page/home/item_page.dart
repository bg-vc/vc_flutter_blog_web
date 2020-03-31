
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vc_flutter_blog_web/json/article_item_bean.dart';
import 'package:vc_flutter_blog_web/widget/hover_zoom_widget.dart';


class ItemPage extends StatefulWidget {
  final ArticleItemBean bean;

  ItemPage(this.bean);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final cardWidth = 0.18 * width < 260 ? 260 : 0.18 * width;
    final cardHeight = 0.6 * cardWidth;

    return Container(
      height: cardHeight * 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          HoverZoomWidget(
            scale: 1.1,
            child: Container(
              margin: const EdgeInsets.all(10),
              width: cardWidth,
              height: cardHeight,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: cardWidth,
                    height: cardHeight,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    ),
                    child: Container(),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: cardWidth,
                    height: cardHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets${widget.bean.imageAddress}'
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 0.86 * cardWidth,
            margin: EdgeInsets.only(
              left: widget.bean.articleName.startsWith(RegExp(r'\d')) ? 0.09 * cardWidth : 0.07 * cardWidth,
              top: 0.015 * height
            ),
            child: Text(
              '${widget.bean.articleName}',
              style: const TextStyle(
                fontSize: 25,
                fontFamily: 'huawen_kt',
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            width: 0.86 * cardWidth,
            margin: EdgeInsets.only(
              left: 0.07 * cardWidth,
            ),
            child: Text(
              '${widget.bean.summary.replaceAll('\n', '')}',
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xff8D8D8D),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
