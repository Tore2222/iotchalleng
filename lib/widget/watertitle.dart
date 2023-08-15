import 'package:flutter/material.dart';

class WaterTile extends StatefulWidget {
  WaterTile(
      {required this.hour,
      required this.minute,
      required this.humidity,
      required this.status,
      required this.toggle});
  final int hour;
  final int minute;
  final int status;
  final int humidity;
  VoidCallback toggle;

  @override
  State<WaterTile> createState() => _WaterTileState();
}

class _WaterTileState extends State<WaterTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
              radius: 25.0, child: Image.asset('assets/images/1.png')),
          title: SwitchListTile(
            title: Text('${widget.hour}:${widget.minute}'),
            subtitle: Text('${widget.humidity}'),
            secondary: Icon(Icons.timer),
            activeColor: Colors.teal,
            activeTrackColor: Colors.green,
            inactiveThumbColor: Colors.black,
            inactiveTrackColor: Colors.blueGrey,
            value: widget.status == 1 ? true : false,
            onChanged: (value) {
              // Gọi hàm callback khi trạng thái thay đổi
              widget.toggle();
            },
          ),
        ),
      ),
    );
  }
}
