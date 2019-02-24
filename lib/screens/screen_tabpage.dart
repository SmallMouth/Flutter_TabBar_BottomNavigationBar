import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  final String contant;
  final int index;

  TabPage(this.index, this.contant);

  @override
  TabPageState createState() {
    return new TabPageState(contant);
  }
}

class TabPageState extends State<TabPage> {
  final String contant;

  TabPageState(this.contant);

  @override
  Widget build(BuildContext context) {
    final _tabOptions = [
      Column(
        children: <Widget>[
          Text(contant),
          Text('Child 0'),
        ],
      ),
      Column(
        children: <Widget>[
          Text(contant),
          Text('Child 1'),
        ],
      ),    Column(
        children: <Widget>[
          Text(contant),
          Text('Child 2'),
        ],
      ),
    ];

    return DefaultTabController(
        length: _tabOptions.length,
        child: Scaffold(
          appBar: AppBar(
            title: Container(
              child: TabBar(
                tabs: [
                  Tab(text: 'Tab0'),
                  Tab(text: 'Tab1'),
                  Tab(text: 'Tab2'),
                ],
              ),
            ),
          ),
          body: TabBarView(children: _tabOptions),
        ));
  }
}
