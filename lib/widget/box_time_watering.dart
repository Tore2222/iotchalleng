import 'package:flutter/material.dart';

class BoxTimeWatering extends StatefulWidget {
  BoxTimeWatering({super.key, required this.Time, required this.Humi});
  final String Time;
  final String Humi;

  @override
  State<BoxTimeWatering> createState() => _BoxTimeWateringState();
}

class _BoxTimeWateringState extends State<BoxTimeWatering> {
  @override
  Widget build(BuildContext context) {
    double heightR, widthR;

    heightR = MediaQuery.of(context).size.height / 1080; //v26
    widthR = MediaQuery.of(context).size.width / 2400;
    return Container(
      height: heightR * 200,
      width: widthR * 400,
      decoration: BoxDecoration(
        color: Color(0xff93b3bf),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: heightR * 15,
          ),
          Text(
            widget.Time,
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(
            height: heightR * 5,
          ),
          Container(
            width: widthR * 300,
            height: heightR * 100,
            child: Image.asset(
              "assets/images/xxxx",
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: heightR * 5,
          ),
          Text(
            widget.Humi,
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }
}
