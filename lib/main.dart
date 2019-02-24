import 'package:flutter/material.dart';
import 'package:flutter_bar/screens/screen_tabpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  final _widgetOptions = [
    Text('Index 0: Home'),
    Text('Index 1: Business'),
    Text('Index 2: School'),
  ];

  List<Widget> _childrenPage = [
    TabPage(0, "Index 0: Home"),
    TabPage(1, "Index 1: Business"),
    TabPage(2, "Index 2: School"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: _childrenPage,
        index: _selectedIndex,
      ), // new,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('school')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurpleAccent,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
