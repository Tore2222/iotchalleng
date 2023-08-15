import 'package:app_tuoi_cay/theme/colors.dart';
import 'package:app_tuoi_cay/view/pump.dart';
import 'package:app_tuoi_cay/view/time_watering.dart';
import 'package:app_tuoi_cay/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'list_time_wattering.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

List<String> values = List.generate(100, (index) => (index + 1).toString());
String selectedValue = '80';

String selectedMode = 'Mode1';

bool isButtonOn1 = false;
double switchPosition1 = 0;

bool isButtonOn2 = false;
double switchPosition2 = 0;

bool isButtonOn3 = false;
double switchPosition3 = 0;

class _SettingPageState extends State<SettingPage> {
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widthR * 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50 * heightR,
            ),

            Text(
              "Notifications setting",
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 25,
              ),
            ),
            Container(
              width: widthR * 2500,
              height: heightR * 300,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: heightR * 15,
                    ),
                    SwitchListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Watering Notifications',
                              style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        activeColor: Colors.teal,
                        activeTrackColor: Colors.green,
                        inactiveThumbColor: Colors.black,
                        inactiveTrackColor: Colors.blueGrey,
                        value: isButtonOn1,
                        onChanged: (bool value) {
                          setState(() {
                            isButtonOn1 = !isButtonOn1;
                          });
                        }),
                    Divider(
                      color: Colors.grey.withOpacity(0.2), // Màu xám với độ mờ
                      thickness: 1, // Độ dày của dòng gạch
                    ),
                    SwitchListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Error Notifications',
                              style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        activeColor: Colors.teal,
                        activeTrackColor: Colors.green,
                        inactiveThumbColor: Colors.black,
                        inactiveTrackColor: Colors.blueGrey,
                        value: isButtonOn2,
                        onChanged: (bool value) {
                          setState(() {
                            isButtonOn2 = !isButtonOn2;
                          });
                        }),
                    Divider(
                      color: Colors.grey.withOpacity(0.2), // Màu xám với độ mờ
                      thickness: 1, // Độ dày của dòng gạch
                    ),
                    SwitchListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Huminity Notifications',
                              style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        activeColor: Colors.teal,
                        activeTrackColor: Colors.green,
                        inactiveThumbColor: Colors.black,
                        inactiveTrackColor: Colors.blueGrey,
                        value: isButtonOn3,
                        onChanged: (bool value) {
                          setState(() {
                            isButtonOn3 = !isButtonOn3;
                          });
                        }),
                  ],
                ),
              ),
            ),
            // gtActions(),
            SizedBox(
              height: 20,
            ),

            Text(
              "Device setting",
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 25,
              ),
            ),
            Container(
              width: heightR * 1000,
              height: widthR * 1700,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mode",
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 25,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedMode,
                              items: ['Mode1', 'Mode2', 'Mode3', 'Mode4']
                                  .map((mode) {
                                return DropdownMenuItem<String>(
                                  value: mode,
                                  child: Text(mode),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedMode = value!;
                                  // doSomething(value) // Gọi hàm xử lý sự kiện (hàm được viết phía ngoài)
                                });
                              },
                              dropdownColor: Colors.white,
                              icon: Icon(Icons.arrow_drop_down),
                              elevation: 1,
                              style: TextStyle(color: Colors.black),
                              selectedItemBuilder: (BuildContext context) {
                                return ['Mode1', 'Mode2', 'Mode3', 'Mode4']
                                    .map<Widget>((String mode) {
                                  return Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color:
                                          Colors.green, // Màu nền khi đã chọn
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(mode,
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Divider(
                      color: Colors.grey.withOpacity(0.2), // Màu xám với độ mờ
                      thickness: 1, // Độ dày của dòng gạch
                    ),
                    SizedBox(height: 5),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pump",
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 25,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PumpPage()));
                            },
                          )
                        ]),
                    SizedBox(height: 5),
                    Divider(
                      color: Colors.grey.withOpacity(0.2), // Màu xám với độ mờ
                      thickness: 1, // Độ dày của dòng gạch
                    ),
                    SizedBox(height: 5),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Max Humidity",
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 25,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedValue,
                                items: values.map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value!;
                                    // doSomething(value) // Gọi hàm xử lý sự kiện (hàm được viết phía ngoài)
                                  });
                                },
                                dropdownColor: Colors.white,
                                icon: Icon(Icons.arrow_drop_down),
                                elevation: 1,
                                style: TextStyle(color: Colors.black),
                                selectedItemBuilder: (BuildContext context) {
                                  return values.map<Widget>((value) {
                                    return Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            Colors.green, // Màu nền khi đã chọn
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(value,
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    );
                                  }).toList();
                                },
                              ),
                            ),
                          )
                        ]),
                    SizedBox(height: 5),
                    Divider(
                      color: Colors.grey.withOpacity(0.2), // Màu xám với độ mờ
                      thickness: 1, // Độ dày của dòng gạch
                    ),
                    SizedBox(height: 5),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Time Watering",
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 25,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => TimeWatering()));
                            },
                          )
                        ]),
                    SizedBox(height: 5),
                    Divider(
                      color: Colors.grey.withOpacity(0.2), // Màu xám với độ mờ
                      thickness: 1, // Độ dày của dòng gạch
                    ),
                    SizedBox(height: 5),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Config Wifi",
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 25,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PumpPage()));
                            },
                          )
                        ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
