import 'package:flutter/material.dart';
import 'package:whats_app/pages/calls_page.dart';
import 'package:whats_app/pages/camera_page.dart';
import 'package:whats_app/pages/chats_page.dart';
import 'package:whats_app/pages/status_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'What\'sApp',
      theme: ThemeData(
        accentColor: Color(0xff25d366),
        primaryColor: Color(0xff075e54),
      ),
      home: MyHomePage(title: 'What\'sApp'),
    );
  }
}

//   dd
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int appbar = 1;
  TabController _tabController;
  var floatingIcons = [
    Icon(Icons.message, color: Colors.white),
    Icon(Icons.photo_camera, color: Colors.white),
    Icon(Icons.add_call, color: Colors.white)
  ];
  int floatingIconSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
    _tabController.addListener(tabListener);
  }

  // change the icons where changed tabbars
  tabListener() {
    if (_tabController.index == 1) {
      setState(() {
        floatingIconSelectedIndex = 0;
      });
    } else if (_tabController.index == 2) {
      setState(() {
        floatingIconSelectedIndex = 1;
      });
    } else if (_tabController.index == 3) {
      setState(() {
        floatingIconSelectedIndex = 2;
      });
    }
  }

  get myAppBarClosed => SliverAppBar(
        pinned: true,
        floating: true,
        centerTitle: false,
        title: Text(widget.title),
        bottom: new TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.camera_alt),
            ),
            new Tab(
              text: 'CHATS',
            ),
            new Tab(
              text: 'STATUS',
            ),
            new Tab(
              text: 'CALLS',
            ),
          ],
        ),
        actions: <Widget>[
          new IconButton(
            onPressed: () {
              setState(() {
                appbar = 2;
              });
            },
            icon: new Icon(Icons.search),
          ),
          new PopupMenuButton<String>(
            icon: new Icon(Icons.more_vert),
            onSelected: (String selected) {
              // if(selected =='settings') do something else ...
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem<String>(
                  value: 'new_group',
                  child: new Text('New group'),
                ),
                PopupMenuItem<String>(
                  value: 'new_broadcast',
                  child: new Text('New broadcast'),
                ),
                PopupMenuItem<String>(
                  value: 'whats_app_web',
                  child: new Text('WhatsApp Web'),
                ),
                PopupMenuItem<String>(
                  value: 'starred_message',
                  child: new Text('Starred message'),
                ),
                PopupMenuItem<String>(
                  value: 'settings',
                  child: new Text('Settings'),
                ),
              ];
            },
          ),
        ],
      );

  get myAppBarOpen => SliverAppBar(
        pinned: true,
        floating: true,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: new TextFormField(
          decoration: new InputDecoration(
              border: InputBorder.none, hintText: 'Search...'),
        ),
        actions: <Widget>[
          new IconButton(
            onPressed: () {
              setState(() {
                this.appbar = 1;
              });
            },
            icon: new Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            (this.appbar == 1) ? myAppBarClosed : myAppBarOpen,
          ];
        },
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            new CameraPage(),
            new Chatspage(),
            new StatusPage(),
            new CallsPage()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: floatingIcons[floatingIconSelectedIndex],
      ),
    );
  }
}
