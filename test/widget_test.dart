bên trong firebase của tôi có một trường timesetting_pump gồm các thành phần con là time1, time2, time3.... và trong time1,time2,time3... gồm các trường dữ liệu là minute và humidity . tôi muốn các dữ liệu đó được thêm và thay vào dữ liệu của Time và Humi của đoạn code này để hiển thị lên app
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