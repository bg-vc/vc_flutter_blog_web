import 'package:flutter/material.dart';
import 'package:vc_flutter_blog_web/json/article_item_bean.dart';
import 'package:vc_flutter_blog_web/logic/home_page_logic.dart';

import 'home/item_page.dart';
import 'nav_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logic = HomePageLogic();
  List<ArticleItemBean> dataList = [];

  @override
  void initState() {
    logic.getArticleData('config_study.json').then((List<ArticleItemBean> resultList) {
      dataList = resultList;
      print('HomePage dataList length: ${dataList.length}');
      setState(() {
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final fontSizeByHeight = height * 30 / 1200;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 0.07 * width, right: 0.07 * width, top: 0.05 * height),
        child: Stack(
          children: <Widget>[
            NavPage(pageType: PageType.home),
            Container(
              margin: EdgeInsets.only(top: 60),
              child: Container(
                  margin: EdgeInsets.only(
                      left: 0.06 * width,
                      right: 0.06 * width,
                      top: 0.02 * width
                  ),
                  child: dataList.isEmpty ? Center(
                    child: CircularProgressIndicator(),
                  ) : NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll) {
                      overScroll.disallowGlow();
                      return true;
                    },
                    child: GridView.count(
                      crossAxisCount: getCrossCount(width),
                      padding: EdgeInsets.fromLTRB(
                          0.02 * width, 0.02 * height, 0.02 * width, 0),
                      children: List.generate(dataList.length, (index)  {
                        return GestureDetector(
                          onTap: () {

                          },
                          child: ItemPage(dataList[index]),
                        );
                      }),
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }

  int getCrossCount(double width) {
    final result = ((width - 400) ~/ 300) < 1 ? 1 : ((width - 400) ~/ 300);
    return result > 3 ? 3 : result;
  }
}
