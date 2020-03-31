import 'package:flutter/material.dart';
import 'package:vc_flutter_blog_web/json/friend_link_bean.dart';
import 'package:vc_flutter_blog_web/page/link/item_page.dart';

import 'nav_page.dart';


class LinkPage extends StatefulWidget {
  @override
  _LinkPageState createState() => _LinkPageState();
}

class _LinkPageState extends State<LinkPage> {
  final dataList = FriendLinkBean().beans;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
            left: 0.07 * width, right: 0.07 * width, top: 0.05 * height),
        child: Stack(
          children: <Widget>[
            NavPage(pageType: PageType.link,),
            Container(
              margin: EdgeInsets.only(top: 60),
              child: Container(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overScroll) {
                    overScroll.disallowGlow();
                    return true;
                  },
                  child: SingleChildScrollView(
                    child: Wrap(
                      children: List.generate(dataList.length, (index) {
                        return ItemPage(dataList[index]);
                      }),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
