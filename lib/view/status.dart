import 'package:app_tuoi_cay/theme/colors.dart';
import 'package:app_tuoi_cay/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../widget/box_time_watering.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: status ? secondary : Colors.grey[850],
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widthR * 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25 * heightR,
            ),
            Container(
              height: heightR * 100,
              width: widthR * 2500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                gradient: LinearGradient(
                  begin: Alignment(-0.972, 0.06),
                  end: Alignment(0.974, 0.095),
                  colors: status
                      ? <Color>[
                          Color(0x3fbde3f2),
                          Color(0xbf77cff2),
                          Color(0xff41c0f2),
                          Color(0xff0fb2f2),
                          Color(0xff0d8bd9)
                        ]
                      : <Color>[
                          Color(0xff02070d),
                          Color(0xff193b59),
                          Color(0xff122a40),
                          Color(0xff3c5e73),
                          Color(0xff93b3bf)
                        ],
                  stops: <double>[0, 0.266, 0.542, 0.786, 1],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: widthR / 4,
                  ),
                  Container(
                    height: heightR * 90,
                    width: heightR * 90,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(90)),
                    child: Image.asset(
                      "assets/images/xxxx",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: widthR * 700,
                  ),
                  Text(
                    status ? 'Wake Status' : 'Sleep Status',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    width: widthR / 4,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25 * heightR,
            ),
            Container(
              height: heightR * 125,
              width: widthR * 2500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: status
                    ? LinearGradient(
                        begin: Alignment(0, -1.057),
                        end: Alignment(0.006, 1.161),
                        colors: <Color>[
                          Color(0xff57a6fe),
                          Color(0xff90c9ff),
                          Color(0xffffffff)
                        ],
                        stops: <double>[0, 0.562, 1],
                      )
                    : LinearGradient(
                        begin: Alignment(0, -1.057),
                        end: Alignment(0.006, 1.161),
                        colors: <Color>[
                          Color(0xff1f5565),
                          Color(0xff3c5e73),
                          Color(0xff93b3bf)
                        ],
                        stops: <double>[0, 0.562, 1],
                      ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: widthR / 4,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Saturday, 17 June',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      Text(
                        '8:00 AM',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Roboto',
                        ),
                      )
                    ],
                  ),
                  Text(
                    '70 %',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    width: widthR / 4,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: heightR * 25,
            ),
            Text(
              "Time watering",
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: heightR * 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: status ? secondary : Colors.grey[850],
              ),
              width: widthR * 2500,
              height: heightR *
                  200, // Đặt chiều cao cho container chứa các container con
              child: ListView(
                scrollDirection: Axis.horizontal, // Định hướng cuộn ngang
                children: [
                  BoxTimeWatering(Time: '10:00 AM', Humi: '80%'),
                  SizedBox(
                    width: widthR * 100,
                  ),
                  BoxTimeWatering(Time: '10:00 AM', Humi: '80%'),
                  SizedBox(
                    width: widthR * 100,
                  ),
                  BoxTimeWatering(Time: '10:00 AM', Humi: '80%'),
                  SizedBox(
                    width: widthR * 100,
                  ),
                  BoxTimeWatering(Time: '10:00 AM', Humi: '80%'),
                  SizedBox(
                    width: widthR * 100,
                  ),
                  BoxTimeWatering(Time: '10:00 AM', Humi: '80%'),
                  SizedBox(
                    width: widthR * 100,
                  ),
                  BoxTimeWatering(Time: '10:00 AM', Humi: '80%'),
                  SizedBox(
                    width: widthR * 100,
                  ),
                  BoxTimeWatering(Time: '10:00 AM', Humi: '80%'),
                  SizedBox(
                    width: widthR * 1 - 0,
                  ), // Thêm các container con khác tại đây
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Device",
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 25,
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  color: Color(0xff93b3bf),
                  borderRadius: BorderRadius.circular(30),
                ),
                width: widthR * 2500,
                height: heightR *
                    400, // Đặt chiều cao cho container chứa các container con
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: widthR * 100,
                        ),
                        Container(
                          height: heightR * 160,
                          width: widthR * 400,
                          child: Image.asset(
                            "assets/images/xxxx",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          width: widthR * 25,
                        ),
                        const Column(
                          children: [
                            Text(
                              "Pump",
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Total: 6",
                              style: TextStyle(
                                // fontWeight: FontWeight.w200,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Active: 5",
                              style: TextStyle(
                                // fontWeight: FontWeight.w200,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: heightR * 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: widthR * 100,
                        ),
                        Container(
                          height: heightR * 160,
                          width: widthR * 400,
                          child: Image.asset(
                            "assets/images/xxxx",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          width: widthR * 25,
                        ),
                        const Column(
                          children: [
                            Text(
                              "Hose",
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Total: 50",
                              style: TextStyle(
                                // fontWeight: FontWeight.w200,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Active: 40",
                              style: TextStyle(
                                // fontWeight: FontWeight.w200,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
