import 'dart:async';
import 'dart:html';

import 'package:app_tuoi_cay/theme/colors.dart';
import 'package:app_tuoi_cay/widget/custom_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widget/box_time_watering.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference().child('person0/id0');

  bool status = true;
  late DateTime _currentTime;
  List<Map<String, dynamic>> timeSettings = [];

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    // Cập nhật thời gian mỗi giây
    Timer.periodic(Duration(minutes: 1), (Timer timer) {
      if (mounted) {
        setState(() {
          _currentTime = DateTime.now();
        });
      }
    });
    _databaseReference.child('timesetting_pump').onValue.listen((event) {
      if (event.snapshot != null) {
        DataSnapshot snapshot = event.snapshot as DataSnapshot;
        Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;

        List<Map<String, dynamic>> settings = [];

        data.forEach((key, value) {
          if (value != null && value is Map<dynamic, dynamic>) {
            if (value.containsKey('minute') &&
                value.containsKey('humidity') &&
                value.containsKey('hour') &&
                value.containsKey('status')) {
              if (value['status'] == 1) {
                settings.add({
                  'hour': value['hour'].toString(),
                  'minute': value['minute'].toString(),
                  'humidity': value['humidity'].toString(),
                });
              }
            }
          }
        });

        setState(() {
          timeSettings = settings;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: status ? appBgColorSecondary : Colors.grey[850],
      appBar: CustomAppbar(),
      body: getBody(),
    );
  }

  getBody() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd').format(now);
    String formattedTime = DateFormat('hh:mm a').format(now);
    String formattedMonth = DateFormat('MMMM').format(now);
    String formattedDayOfWeek = DateFormat('EEEE').format(now);
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
                    child: status ? Image.asset(
                      "sun.png",
                      fit: BoxFit.contain,
                    ) : Image.asset(
                      "moon.png",
                      fit: BoxFit.contain,
                    )
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
                        '$formattedDayOfWeek, $formattedDate $formattedMonth',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      Text(
                        '$formattedTime',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Roboto',
                        ),
                      )
                    ],
                  ),
                  StreamBuilder(
                    stream: _databaseReference.onValue,
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          !snapshot.hasError &&
                          snapshot.data!.snapshot.value != null) {
                        // Truy cập dữ liệu từ snapshot
                        Map<dynamic, dynamic> data = snapshot
                            .data!.snapshot.value as Map<dynamic, dynamic>;

                        String humi = data['humidity_current'].toString();

                        return Text(
                          '$humi %',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Colors.white,
                            fontFamily: 'Roboto',
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
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
                fontWeight: FontWeight.bold,
                fontSize: 25,

              ),
            ),
            SizedBox(
              height: heightR * 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: status ? appBgColorSecondary : Colors.grey[850],
              ),
              width: widthR * 2500,
              height: heightR *
                  200, // Đặt chiều cao cho container chứa các container con
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: timeSettings.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      BoxTimeWatering(
                        Time:
                            '${timeSettings[index]['hour']}:${timeSettings[index]['minute']}',
                        Humi: '${timeSettings[index]['humidity']}%',
                      ),
                      SizedBox(
                          width: widthR *
                              50), // Thêm khoảng cách ngang giữa các BoxTimeWatering
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Device",
              style: TextStyle(
                fontWeight: FontWeight.bold,
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
                            "assets/icon2.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          width: widthR * 25,
                        ),
                        Column(
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
                            "assets/icon3.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          width: widthR * 25,
                        ),
                        Column(
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
