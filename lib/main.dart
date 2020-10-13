import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:play_around_flutter/personBloc.dart';
import 'package:play_around_flutter/personModel.dart';
import 'package:play_around_flutter/scroll_listener.dart';
import 'package:play_around_flutter/uploadImage.dart';

import 'camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    logError(e.code, e.description);
  }
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScrollListenerPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MenuItem {
  final Icon leading;
  final String name;
  final int index;
  MenuItem({this.leading, this.name, this.index});
}

class MenuItemIcon {
  final Icon leading;
  final int index;
  MenuItemIcon({this.leading, this.index});
}

class _MyHomePageState extends State<MyHomePage> {
  List<MenuItem> menuItems;
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  int _pageIndex = 0;

  List<String> title = [
    "User",
    "Alarm",
    "Account Balance",
    "Camera",
    "Upload Image"
  ];

  List<MenuItemIcon> menuItemIcons = [
    MenuItemIcon(
      leading: Icon(Icons.accessibility),
      index: 0,
    ),
    MenuItemIcon(
      leading: Icon(Icons.access_alarm),
      index: 1,
    ),
    MenuItemIcon(
      leading: Icon(Icons.account_balance),
      index: 2,
    ),
    MenuItemIcon(
      leading: Icon(Icons.camera_alt),
      index: 3,
    ),
    MenuItemIcon(
      leading: Icon(Icons.cloud_upload),
      index: 4,
    ),
  ];

  _handleDrawer() {
    _key.currentState.openDrawer();
    print("Drawer clicked");
  }

  Widget _loadBody() {
    Widget body = UserPage();
    switch (menuItemIcons.singleWhere((item) {
      return item.index == _pageIndex;
    }).index) {
      case 0:
        body = UserPage();
        break;
      case 1:
        body = AlarmPage();
        break;
      case 2:
        body = AccountBalancePage();
        break;
      case 3:
        body = CameraPage();
        break;
      case 4:
        body = UploadImage();
        break;
      default:
        body = Container();
    }
    return body;
  }

  _loadDrawer(BuildContext context) {
    menuItems = [
      MenuItem(leading: Icon(Icons.accessibility), name: "User", index: 0),
      MenuItem(
        leading: Icon(Icons.access_alarm),
        name: "Alarm",
        index: 1,
      ),
      MenuItem(
          name: "Account Balance",
          leading: Icon(Icons.account_balance),
          index: 2),
      MenuItem(name: "Camera", leading: Icon(Icons.camera_alt), index: 3),
      MenuItem(name: "Upload Image", leading: Icon(Icons.camera_alt), index: 4),
    ];
    List<Widget> menu = List();
    menu.add(
      Container(
        height: 200.0,
        child: DrawerHeader(
          child: Wrap(
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Image.asset("assets/images/nitro.png"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "SOPHEAP Sopheadavid",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  "0966441244",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        ),
      ),
    );
    menuItems.forEach((item) {
      menu.add(
        Column(
          children: <Widget>[
            ListTile(
              leading: item.leading,
              title: Text(item.name),
              onTap: () {
                setState(() {
                  this._pageIndex = item.index;
                  FocusScope.of(context).requestFocus(FocusNode());
                  Navigator.pop(context);
                });
              },
            ),
//              Divider(color: Colors.grey,)
          ],
        ),
      );
    });
    return menu;
  }

//  _buildCupertinoActionSheet(){
//    showCupertinoDialog(
//        context: context,
//        builder: (context){
//          return Align(
//            alignment: Alignment.bottomCenter,
//            child: CupertinoActionSheet(
//              title: Text("Some choices!"),
//              actions: <Widget>[
//                CupertinoActionSheetAction(
//                  onPressed: () => Navigator.pop(context),
//                  child: Text("One"),
//                ),
//                CupertinoActionSheetAction(
//                  onPressed: () => Navigator.pop(context),
//                  child: Text("Two"),
//                ),
//                CupertinoActionSheetAction(
//                  onPressed: () => Navigator.pop(context),
//                  child: Text("Three"),
//                ),
//              ],
//            )
//          );
//        }
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(title[_pageIndex]),
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          onPressed: () {
            FocusScope.of(context).requestFocus(FocusNode());
            _handleDrawer();
          },
        ),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.dialpad),
//            onPressed: () => _buildCupertinoActionSheet(),
//          )
//        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: _loadDrawer(context),
        ),
      ),
      body: SafeArea(
        child: _loadBody(),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  GlobalKey<RefreshIndicatorState> _refreshKey =
      new GlobalKey<RefreshIndicatorState>();
  PersonBloc _personBloc = personBloc;

  Future<Null> _handleRefresh() async {
    await new Future.delayed(new Duration(seconds: 1));
    setState(() {
      print("Loading!!!");
    });
    return null;
  }

  _buildListPerson() {
    return StreamBuilder<List<New>>(
      stream: _personBloc.person,
      builder: (context, AsyncSnapshot<List<New>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length > 0) {
            var _new = snapshot.data;
            return ListView.builder(
                itemCount: _new.length,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 123,
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: 90,
                                  width: 120,
                                  margin: EdgeInsets.only(top: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image:
                                          NetworkImage(_new[index].url ?? ""),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  //Name
                                  Text(
                                    _new[index].title,
                                    maxLines: 1,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  //Note
                                  Text(
                                    _new[index].description,
                                    maxLines: 3,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Date
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            _new[index].createdAt,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ],
                  );
                });
          } else {
            return _loadingWidget();
          }
        } else {
          return _loadingWidget();
        }
      },
    );
  }

  _loadingWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SpinKitRing(
          color: Colors.blueAccent,
          size: 40.0,
        ),
        Text("កំពង់ដំណើរការ")
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _personBloc.fetchAndRefreshPerson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.green,
      onRefresh: () async {
        return await _personBloc.fetchAndRefreshPerson();
      },
      child: Container(
        margin: EdgeInsets.all(8),
        child: _buildListPerson(),
      ),
    );
  }
}

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Alarm"),
      ),
    );
  }
}

class AccountBalancePage extends StatefulWidget {
  @override
  _AccountBalancePageState createState() => _AccountBalancePageState();
}

class _AccountBalancePageState extends State<AccountBalancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Account Balance"),
      ),
    );
  }
}

// Border radius on container by using ClipRRect
//      body: Center(
//        child: ClipRRect(
//          borderRadius: BorderRadius.all(Radius.circular(20.0)),
//          child: Container(
//            width: 300,
//            height: 300,
//            color: Colors.blueAccent,
//          ),
//        ),
//      ),

// Concat text
//      body: Center(
//        child: RichText(
//          text: TextSpan(
//            text: "Android ",
//            style: TextStyle(color: Colors.black, fontSize: 25.0),
//            children: [
//              TextSpan(text: "Studio", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 25.0))
//            ]
//          ),
//        )
//      ),
