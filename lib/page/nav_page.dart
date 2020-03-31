import 'package:flutter/material.dart';
import 'package:vc_flutter_blog_web/widget/bar_button.dart';

class NavPage extends StatefulWidget {
  final PageType pageType;

  NavPage({this.pageType});

  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  PageType pageType;

  @override
  void initState() {
    pageType = widget.pageType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final fontSize = height * 30 / 1200;
    return Container(
      height: 70,
      width: 0.86 * width,
      child: Row(
        children: <Widget>[
          Row(
            children: <Widget>[
              FlutterLogo(
                size: getScaleSizeByHeight(height, 75.0),
                colors: Colors.blueGrey,
              ),
              const SizedBox(
                width: 30.0,
              ),
              Container(
                height: getScaleSizeByHeight(height, 50.0),
                width: 3.0,
                color: const Color(0xff979797),
              ),
              const SizedBox(
                width: 30.0,
              ),
              Text(
                'Flutter Web Demo',
                style: TextStyle(
                  fontSize: fontSize,
                  fontFamily: 'huawen_kt',
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: BarButton(
                    child: Text(
                      '首页',
                      style: TextStyle(
                        fontSize: fontSize,
                        fontFamily: 'huawen_kt',
                      ),
                    ),
                    onPressed: () {
                      if (pageType == PageType.home) return;
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    isChecked: pageType == PageType.home,
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: BarButton(
                    child: Text(
                      '标签',
                      style: TextStyle(
                        fontSize: fontSize,
                        fontFamily: 'huawen_kt',
                      ),
                    ),
                    onPressed: () {
                      if (pageType == PageType.tab) return;
                      pushAndRemove(context, 'tab');
                    },
                    isChecked: pageType == PageType.tab,
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: BarButton(
                    child: Text(
                      '友链',
                      style: TextStyle(
                        fontSize: fontSize,
                        fontFamily: 'huawen_kt',
                      ),
                    ),
                    onPressed: () {
                      if (pageType == PageType.link) return;
                      pushAndRemove(context, 'link');
                    },
                    isChecked: pageType == PageType.link,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void pushAndRemove(BuildContext context, String routeName) {
    if (widget.pageType == PageType.home) {
      print(0000);
      Navigator.pushNamed(context, '/$routeName');
    } else {
      print(1111);
      Navigator.pushReplacementNamed(context, '/$routeName');
    }
  }

  double getScaleSizeByHeight(double height, double size) {
    return size * height / 1200;
  }
}

enum PageType { home, tab, link }
