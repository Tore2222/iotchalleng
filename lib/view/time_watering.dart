import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../widget/custom_appbar.dart';
import 'package:app_tuoi_cay/theme/colors.dart';

import '../widget/watertitle.dart';
import 'add_time_watering.dart';


class TimeWatering extends StatefulWidget {
  const TimeWatering({super.key});

  @override
  State<TimeWatering> createState() => _TimeWateringState();
}

class _TimeWateringState extends State<TimeWatering> {
  DatabaseReference _databaseReference =
  FirebaseDatabase.instance.reference().child('person0/id0');
  List<Map<String, dynamic>> timeSettings = [];

  void toggle(int index) {
    //==setState(() {
    if (timeSettings[index]['status'] == 0) {
      _databaseReference.child('timesetting_pump/time$index/status').set(1);
    } else {
      _databaseReference.child('timesetting_pump/time$index/status').set(0);
    } //  _manager.publish(parse_json_data(get_data_device()),"test");
  }

  void initState() {
    super.initState();

    // Lắng nghe sự kiện thay đổi dữ liệu từ Firebase
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
              settings.add({
                'hour': value['hour'],
                'minute': value['minute'],
                'humidity': value['humidity'],
                'status': value['status'],
              });
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
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20*heightR,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20*heightR, 0, 20*heightR, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Time wartering",
                    style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28*heightR
                  ),),

                  IconButton(
                    icon: Icon(Icons.add_circle,size: 50*heightR,color: greenbase,),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddTimeWatering()));
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 700*heightR,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: timeSettings.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      WaterTile(
                          hour: timeSettings[index]['hour'],
                          minute: timeSettings[index]['minute'],
                          humidity: timeSettings[index]['humidity'],
                          status: timeSettings[index]['status'],
                          toggle: () => toggle(index))
                    ],
                  );
                },
              )
            )
            // ListView.builder(itemBuilder: ),
          ],
        ),
      ),
    );
  }
}
