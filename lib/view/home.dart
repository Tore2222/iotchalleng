import 'package:app_tuoi_cay/view/history.dart';
import 'package:app_tuoi_cay/view/setting.dart';
import 'package:app_tuoi_cay/view/status.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:icon_forest/icon_forest.dart';
import '../theme/colors.dart';
import '../widget/bottombar_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeTab = 0;

  @override
  void initState() {
    super.initState();
    // InternetPopup().initialize(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: getBottomBar(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          body: getBarPage()),
    );
  }

  // Widget getHomeButton(){
  //   double  heightR,widthR;
  //   heightR = MediaQuery.of(context).size.height / 1080; //v26
  //   widthR = MediaQuery.of(context).size.width / 2400;
  //   var curR = widthR;
  //   return Container(
  //     margin: EdgeInsets.only(top: 28*heightR),
  //     // padding: EdgeInsets.all(30*heightR),
  //     child: GestureDetector(
  //       onTap: () {
  //         setState(() {
  //           activeTab= 2;
  //         });
  //       },
  //       child: Container(
  //         padding: EdgeInsets.all(60*curR),
  //         decoration: BoxDecoration(
  //           border: Border.all(
  //             color: primary,
  //           ),
  //           borderRadius: BorderRadius.all(Radius.circular(20)),
  //           color: primary,
  //           //shape: BoxShape.circle,
  //         ),
  //         child: Icon(Icons.qr_code_scanner,
  //           color: Colors.white,
  //           size: 280*curR,),
  //       ),
  //     ),
  //   );
  // }

  Widget getBottomBar() {
    double heightR, widthR;
    heightR = MediaQuery.of(context).size.height / 1080; //v26
    widthR = MediaQuery.of(context).size.width / 2400;
    var curR = widthR;
    return Container(
      height: 118 * heightR,
      width: double.infinity,
      decoration: BoxDecoration(
          color: appBgColor,
          borderRadius: BorderRadius.only(),
          boxShadow: [
            BoxShadow(
                color: shadowColor.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(0, 1)),
            BoxShadow(
              color: Colors.black,
              offset: Offset(1, 1),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ]),
      child: Padding(
          padding: EdgeInsets.only(
              left: 125 * widthR, right: 125 * widthR, top: 35 * heightR),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            BottomBarItem(
              Icons.home_rounded,
              isActive: activeTab == 0,
              activeColor: primary,
              onTap: () {
                setState(() {
                  activeTab = 0;
                });
              },
            ),
            BottomBarItem(
              Icons.settings,
              isActive: activeTab == 1,
              activeColor: primary,
              onTap: () {
                setState(() {
                  activeTab = 1;
                });
              },
            ),
            BottomBarItem(
              Icons.history,
              isActive: activeTab == 2,
              activeColor: primary,
              onTap: () {
                setState(() {
                  activeTab = 2;
                });
              },
            ),
          ])),
    );
  }

  Widget getBarPage() {
    return IndexedStack(
      index: activeTab,
      children: <Widget>[StatusPage(), SettingPage(), HistoryPage()],
    );
  }
}
