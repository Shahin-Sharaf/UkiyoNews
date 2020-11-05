import 'package:flutter/material.dart';
import 'package:ukiyo/views/home.dart';
import 'package:ukiyo/views/category_view.dart';
import 'package:ukiyo/views/article_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ukiyo/views/about_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentstate = 0;
  final _selectedPage = [Home(), CategoryView(), AboutView()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ukiyo',
      theme: ThemeData(
        fontFamily: 'Nanum',
        primaryColor: Colors.white,
      ),
      // initialRoute: '/',
      // routes: {
      //   '/':(context)=>Home(),
      //   'Category':(context)=>CategoryView(),
      //   'ArticleView':(context)=>ArticleView()
      // },
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Ukiyo',
            style: TextStyle(
                fontFamily: 'Majesty', color: Colors.red, fontSize: 36),
          ),
          elevation: 0,
        ),
        body: _selectedPage[_currentstate],
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentstate,
          onTap: (int index) {
            setState(() {
              _currentstate = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.newspaper),
              label: "Breaking",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.list),
              label: "Categories",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.info_outline), label: 'About'),
          ],
          selectedItemColor: Colors.red,
          iconSize: 20,
          unselectedItemColor: Colors.grey[700],
        ),
      ),
    );
  }
}
