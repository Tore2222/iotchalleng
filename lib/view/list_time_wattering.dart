import 'package:app_tuoi_cay/widget/watertitle.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ListTimeWattering extends StatefulWidget {
  const ListTimeWattering({super.key});

  @override
  State<ListTimeWattering> createState() => _ListTimeWatteringState();
}

class _ListTimeWatteringState extends State<ListTimeWattering> {
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
    return ListView.builder(
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
    );
  }
}
