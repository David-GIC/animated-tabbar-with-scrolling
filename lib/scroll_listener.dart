import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollListenerPage extends StatefulWidget {
  @override
  _ScrollListenerPageState createState() => _ScrollListenerPageState();
}

class _ScrollListenerPageState extends State<ScrollListenerPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  ScrollController scrollController = ScrollController();

  double goToList1;
  double goToList2;
  double goToList3;
  double goToList4;
  double goToList5;
  double goToList6;

  List<double> positionEachList = List<double>(30);

  List<String> tabName = [
    "Fresh Milk",
    "Pizza",
    "Drink",
    "Olala MasitaOTaka",
    "Omi",
    "Cocacola x Pizza x Buger"
  ];

  List<String> list0 = ["GG Man", "Sara", "Dola"];

  List<String> list1 = ["Fa", "GA", "FF", "Fa", "GA", "FF", "Fa", "GA", "FF"];

  List<String> list2 = ["VB", "Dola"];

  List<String> list3 = ["VB", "Dola", "FaFa", "Baba", "DaDa", "OGla"];

  List<String> list4 = [
    "VB",
    "Dola",
  ];

  List<String> list5 = [
    "GG",
    "GG Man Tan",
    "GG Man Tan",
    "GG Man Tan",
    "GG Man Tan",
    "GG Man Tan",
    "GG Man Tan",
    "GG Man Tan",
  ];

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 6, initialIndex: 0);
    scrollController.addListener(onScroll);
    super.initState();
  }

  onScroll() {
    print(
        "${scrollController.position.pixels} vs ${MediaQuery.of(context).size.height}");

    //100 is height of card widget -- 10 is space between each widget -- 262 & 82 included such as top padding, sliver expand height, text widget etc...

    for (int i = 0; i < tabName.length; i++) {
      if (i == 0) {
        positionEachList[0] =
            (100 * list0.length) + (10.0 * list0.length) + 262;
      } else {
        List<String> list = i == 1
            ? list1
            : i == 2 ? list2 : i == 3 ? list3 : i == 4 ? list4 : list5;
        positionEachList[i] = positionEachList[i - 1] +
            ((100 * list.length) + (10 * list.length) + 82);
      }
    }
    if (scrollController.position.pixels < positionEachList[0]) {
      tabController.animateTo(0);
    }
    for (int i = 0; i < tabName.length; i++) {
      if (i > 0) {
        if (scrollController.position.pixels >= positionEachList[i - 1] &&
            scrollController.position.pixels < positionEachList[i]) {
          tabController.animateTo(i);
        }
      }
    }

//    goToList1 = (100 * list1.length) + (10.0 * list1.length) + 62;
//    goToList2 = goToList1 + ((100 * list2.length) + (10 * list2.length) + 62);
//    goToList3 = goToList2 + ((100 * list3.length) + (10 * list3.length) + 62);
//    goToList4 = goToList3 + ((100 * list4.length) + (10 * list4.length) + 62);
//    goToList5 = goToList4 + ((100 * list5.length) + (10 * list5.length) + 62);
//    goToList6 = goToList5 + ((100 * list6.length) + (10 * list6.length) + 62);
//
//    if (scrollController.position.pixels < goToList1) {
//      tabController.animateTo(0);
//    }
//    if (scrollController.position.pixels >= goToList1 &&
//        scrollController.position.pixels < goToList2) {
//      tabController.animateTo(1);
//    }
//
//    if (scrollController.position.pixels >= goToList2 &&
//        scrollController.position.pixels < goToList3) {
//      tabController.animateTo(2);
//    }
//    if (scrollController.position.pixels >= goToList3 &&
//        scrollController.position.pixels < goToList4) {
//      tabController.animateTo(3);
//    }
//
//    if (scrollController.position.pixels >= goToList4 &&
//        scrollController.position.pixels < goToList5) {
//      tabController.animateTo(4);
//    }
//    if (scrollController.position.pixels >= goToList5 &&
//        scrollController.position.pixels < goToList6) {
//      tabController.animateTo(5);
//    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Scrolling with Animated Tap"),
        centerTitle: true,
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: FlutterLogo(),
            ),
          ),
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.white,
            title: TabBar(
              controller: tabController,
              isScrollable: true,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.purple,
              labelColor: Colors.purple,
              labelStyle: TextStyle(
                  color: Colors.purple,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 12),
              indicatorSize: TabBarIndicatorSize.tab,
              onTap: (index) {
//              goToList1 = (100 * list1.length) + (10.0 * list1.length) + 62;
//              goToList2 =
//                  goToList1 + ((100 * list2.length) + (10 * list2.length) + 62);
//              goToList3 =
//                  goToList2 + ((100 * list3.length) + (10 * list3.length) + 62);
//              goToList4 =
//                  goToList3 + ((100 * list4.length) + (10 * list4.length) + 62);
//              goToList5 =
//                  goToList4 + ((100 * list5.length) + (10 * list5.length) + 62);
//              goToList6 =
//                  goToList5 + ((100 * list6.length) + (10 * list6.length) + 62);

                //100 is height of card widget -- 10 is space between each widget -- 62 included such as top padding, text widget etc...

                for (int i = 0; i < tabName.length; i++) {
                  if (i == 0) {
                    positionEachList[0] =
                        (100 * list0.length) + (10.0 * list0.length) + 262;
                  } else {
                    List<String> list = i == 1
                        ? list1
                        : i == 2
                            ? list2
                            : i == 3 ? list3 : i == 4 ? list4 : list5;
                    positionEachList[i] = positionEachList[i - 1] +
                        ((100 * list.length) + (10 * list.length) + 82);
                  }
                }
                for (int i = 0; i < tabName.length; i++) {
                  if (index == 0) {
                    scrollController.animateTo(0,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInCirc);
                  }
                  if (i > 0) {
                    if (index == i) {
                      scrollController.animateTo(positionEachList[i - 1],
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInCirc);
                    }
                  }
                }
//              if (index == 1) {
//                scrollController.animateTo(goToList1,
//                    duration: Duration(milliseconds: 300),
//                    curve: Curves.easeInCirc);
//              }
//              if (index == 2) {
//                scrollController.animateTo(goToList2,
//                    duration: Duration(milliseconds: 300),
//                    curve: Curves.easeInCirc);
//              }
//              if (index == 3) {
//                scrollController.animateTo(goToList3,
//                    duration: Duration(milliseconds: 300),
//                    curve: Curves.easeInCirc);
//              }
//              if (index == 4) {
//                scrollController.animateTo(goToList4,
//                    duration: Duration(milliseconds: 300),
//                    curve: Curves.easeInCirc);
//              }
//              if (index == 5) {
//                scrollController.animateTo(goToList5,
//                    duration: Duration(milliseconds: 300),
//                    curve: Curves.bounceIn);
//              }
              },
              tabs: [
                for (int i = 0; i < tabName.length; i++)
                  Tab(
                    child: Text("${tabName[i]}"),
                  )
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                child: ListView(
                  primary: false,
                  shrinkWrap: true,
//                      physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    _buildListViewItem(list0, 0),
                    _buildListViewItem(list1, 1),
                    _buildListViewItem(list2, 2),
                    _buildListViewItem(list3, 3),
                    _buildListViewItem(list4, 4),
                    _buildListViewItem(list5, 5),
                  ],
                ),
              );
            }, childCount: 1),
          ),
        ],
      ),
    );
  }

  _buildListViewItem(List<String> stringList, int tabIndex) {
    return Container(
      child: ListView.builder(
          itemCount: stringList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          primary: false,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  index == 0
                      ? Container(
                          height: 30,
                          child: Text(
                            "${tabName[tabIndex]}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: index == 0 ? 16 : 0,
                  ),
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: index % 2 == 0 ? Colors.green : Colors.redAccent,
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      "${stringList[index]}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
