import 'package:flutter/material.dart';

import '../widget/custom_appbar.dart';
import 'package:app_tuoi_cay/theme/colors.dart';

class TimeWatering extends StatefulWidget {
  const TimeWatering({super.key});

  @override
  State<TimeWatering> createState() => _TimeWateringState();
}

class _TimeWateringState extends State<TimeWatering> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: CustomAppbar(),
      body: getBody(),
    );
  }

  getBody() {
    double heightR, widthR;
    heightR = MediaQuery.of(context).size.height / 1080; //v26
    widthR = MediaQuery.of(context).size.width / 2400;
    var curR = widthR;
    return SingleChildScrollView(
      
    );
  }
}
