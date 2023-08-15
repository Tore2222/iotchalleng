import 'package:app_tuoi_cay/view/list_time_wattering.dart';
import 'package:app_tuoi_cay/view/pump.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../widget/custom_appbar.dart';
import 'package:app_tuoi_cay/theme/colors.dart';

class TimeWatering extends StatefulWidget {
  const TimeWatering({super.key});

  @override
  State<TimeWatering> createState() => _TimeWateringState();
}

class _TimeWateringState extends State<TimeWatering> {
  DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference().child('person0/id0');
  String? value_choose, minutes_choose, hour_choose;
  Future<List<Map<String, dynamic>>> loadTimeSettings() async {
    List<Map<String, dynamic>> settings = [];

    try {
      var event = await _databaseReference.child('timesetting_pump').once();
      if (event.snapshot != null) {
        DataSnapshot snapshot = event.snapshot as DataSnapshot;
        Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;

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
      }
    } catch (error) {
      print('Error loading time settings: $error');
    }

    return settings;
  }

  List listHumanity = [
    '10',
    '20',
    '30',
    '40',
    '50',
    '60',
    '70',
    '80',
    '90',
    '100',
  ];
  List listHour = [
    '00',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24'
  ];
  List listMinutes = [
    '00',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50',
    '51',
    '52',
    '53',
    '54',
    '55',
    '56',
    '57',
    '58',
    '59',
    '60'
  ];
  int val = 0;
  @override
  void initState() {
    super.initState();
    loadTimeSettings().then((settings) {
      setState(() {
        val = settings.length;
      });
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

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Image.asset(
            'assets/images/1.png',
            width: 100,
            height: 120,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16, right: 10, top: 20),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.white, width: 2),
                  backgroundBlendMode: BlendMode.color,
                  borderRadius: BorderRadius.circular(16)),
              height: 100.0,
              width: 100,
              child: DropdownButton(
                dropdownColor: Colors.white,
                style:
                    const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                value: hour_choose ?? listHour[0],
                onChanged: (newHour) {
                  setState(() {
                    hour_choose = newHour.toString();
                  });
                },
                items: listHour.map((hour) {
                  return DropdownMenuItem(value: hour, child: Text(hour));
                }).toList(),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 10, top: 20),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.white, width: 2),
                  backgroundBlendMode: BlendMode.color,
                  borderRadius: BorderRadius.circular(16)),
              height: 100.0,
              width: 100,
              child: DropdownButton(
                dropdownColor: Colors.white,
                underline: const SizedBox(),
                isExpanded: true,
                style:
                    const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                value: minutes_choose ?? listMinutes[0],
                onChanged: (newMinutes) {
                  setState(() {
                    minutes_choose = newMinutes.toString();
                  });
                },
                items: listMinutes.map((minutes) {
                  return DropdownMenuItem(value: minutes, child: Text(minutes));
                }).toList(),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Humanity',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black38, width: 1),
                      borderRadius: BorderRadius.circular(16)),
                  height: 40,
                  width: 100,
                  child: DropdownButton(
                    hint: const Text('Humanity'),
                    dropdownColor: Colors.white,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    underline: const SizedBox(),
                    isExpanded: true,
                    style: const TextStyle(fontSize: 18, color: Colors.black54),
                    value: value_choose ?? listHumanity[0],
                    onChanged: (newValue) {
                      setState(() {
                        value_choose = newValue.toString();
                      });
                    },
                    items: listHumanity.map((valueItem) {
                      return DropdownMenuItem(
                          value: valueItem, child: Text(valueItem));
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 60,
            height: 50,
            child: TextButton(
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PumpPage()));
                _databaseReference
                    .child('timesetting_pump/time$val/hour')
                    .set(int.parse(hour_choose!));
                _databaseReference
                    .child('timesetting_pump/time$val/humidity')
                    .set(int.parse(value_choose!));
                _databaseReference
                    .child('timesetting_pump/time$val/minute')
                    .set(int.parse(minutes_choose!));
                _databaseReference
                    .child('timesetting_pump/time$val/status')
                    .set(1);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListTimeWattering()));

                // DatabaseService(uid:cnt.toString()).updateDatabase(
                //     hour_choose,
                //     minutes_choose,
                //     value_choose,'time $cnt');
              },
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.white),
          ),
        )
      ],
    );
  }
}
