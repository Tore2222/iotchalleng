
import 'package:app_tuoi_cay/theme/colors.dart';
import 'package:app_tuoi_cay/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({ Key? key }) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: secondary,
        appBar: CustomAppbar(),
        body: getBody(),
      );
  }

  getBody(){
    double  heightR,widthR;
    heightR = MediaQuery.of(context).size.height / 1080; //v26
    widthR = MediaQuery.of(context).size.width / 2400;
    var curR = widthR;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50*heightR,),
          // getActions(),

          SizedBox(height: 50*heightR,),

        ],
      ),
    );
  }

}