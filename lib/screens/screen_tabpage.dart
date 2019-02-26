import 'package:flutter/material.dart';
import 'package:flutter_bar/screens/screen_listpage.dart';
import 'package:flutter_bar/widgets/widget_image_carousel.dart';

class TabPage extends StatefulWidget {
  final String contant;
  final int index;

  TabPage(this.index, this.contant);

  @override
  TabPageState createState() {
    return new TabPageState(contant);
  }
}

class TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  final String contant;

  TabController _tabController;
  ScrollController _scrollViewController;

  TabPageState(this.contant);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _tabOptions = [
      ListPage(),
      Column(
        children: <Widget>[
          Text(contant),
          Text('Child 1'),
        ],
      ),
      Column(
        children: <Widget>[
          Text(contant),
          Text('Child 2'),
        ],
      ),
    ];

    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, boxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Text('Tab Controller Example'),
                pinned: true,
                floating: true,
                forceElevated: boxIsScrolled,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  centerTitle: true,
                  background: Container(
                    decoration: new BoxDecoration(color: Colors.red),
                    child: ImageCarousel(),
                  ),
                ),
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(text: 'Tab0'),
                    Tab(text: 'Tab1'),
                    Tab(text: 'Tab2'),
                  ],
                  controller: _tabController,
                ),
              )
            ];
          },
          body: TabBarView(
            children: _tabOptions,
            controller: _tabController,
          )),
    );
//    return DefaultTabController(
//        length: _tabOptions.length,
//        child: Scaffold(
//          appBar: AppBar(
//            title: Container(
//              child: TabBar(
//                tabs: [
//                  Tab(text: 'Tab0'),
//                  Tab(text: 'Tab1'),
//                  Tab(text: 'Tab2'),
//                ],
//              ),
//            ),
//          ),
//          body: TabBarView(children: _tabOptions),
//        ));
  }
}
