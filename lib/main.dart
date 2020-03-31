import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vc_flutter_blog_web/page/home_page.dart';
import 'package:vc_flutter_blog_web/page/link_page.dart';
import 'package:vc_flutter_blog_web/page/tab_page.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: 'Flutter Web Demo',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (BuildContext context) => HomePage(),
        '/tab': (BuildContext context) => TabPage(),
        '/link': (BuildContext context) => LinkPage(),
      },
    );
  }
}
