import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vc_flutter_blog_web/json/archive_item_bean.dart';

import 'nav_page.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  List<ArchiveItemBean> dataList = [];

  @override
  void initState() {
    ArchiveItemBean.loadAsset('tag').then((List<ArchiveItemBean> resultList) {
      dataList = resultList;
      setState(() {});
    });
    super.initState();
  }

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
            NavPage(pageType: PageType.tab),
            Container(
              margin:
                  EdgeInsets.only(top: 140, left: width / 10, right: width / 10),
              child: Card(
                  child: dataList.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          alignment: Alignment.center,
                          height: height / 2,
                          child: SingleChildScrollView(
                            child: Wrap(
                              children: List.generate(dataList.length, (index) {
                                final item = dataList[index];
                                return FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    '${item.tag}',
                                    style: TextStyle(
                                      fontSize: (Random().nextInt(40) + 20)
                                          .toDouble(),
                                      fontFamily: 'huawen_kt',
                                      color: Colors.primaries[Random()
                                          .nextInt(Colors.primaries.length)],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        )),
            )
          ],
        ),
      ),
    );
  }
}
