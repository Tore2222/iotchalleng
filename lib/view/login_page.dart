import 'package:app_tuoi_cay/view/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import '../dialog/loading_dialog.dart';
import '../dialog/msg_dilog.dart';
import 'home.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    double heightR, widthR;
    heightR = MediaQuery.of(context).size.height / 1080; //v26
    widthR = MediaQuery.of(context).size.width / 2400;
    var curR = widthR;
    Widget example1 = SplashScreenView(
      navigateRoute: LoginPage(),
      duration: 5000,
      imageSize: 300,
      imageSrc: "assets/icon2.png",
      text: "Xin Chào",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 220 * curR,
      ),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.white,
    );

    return MaterialApp(
      home: example1,
      theme: _themeData(Brightness.light),
      darkTheme: _themeData(Brightness.light),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 140,
              ),
              Image.asset(
                "assets/icon1.png",
                scale: 2,
              ),
              //Image.asset("assets/images/ic_fight.png"),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 6),
                child: Text(
                  "Welcome back!",
                  style: TextStyle(fontSize: 22, color: Color(0xff333333)),
                ),
              ),
              // Text(
              //   "Login to continue using iGarden",
              //   style: TextStyle(fontSize: 16, color: Color(0xff606470)),
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 145, 0, 20),
                child: TextField(
                  controller: _emailController,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon:
                          Container(width: 50, child: Icon(Icons.email)),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffCED0D2), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)))),
                ),
              ),
              TextField(
                controller: _passController,
                style: TextStyle(fontSize: 18, color: Colors.black),
                obscureText:
                    !showPassword, // Sử dụng trạng thái của biến showPassword để hiện/ẩn mật khẩu
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Container(
                    width: 50,
                    child: Icon(Icons.password),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                        showPassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        showPassword =
                            !showPassword; // Khi nhấn vào nút, thay đổi trạng thái của biến showPassword
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffCED0D2), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints.loose(Size(double.infinity, 50)),
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ForgotPassword()));
                    },
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(fontSize: 16, color: Color(0xff3277D8)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                      onPressed: () {
                        _onLoginClick();
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: RichText(
                  text: TextSpan(
                      text: "New user? ",
                      style: TextStyle(color: Color(0xff606470), fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()));
                              },
                            text: "Sign up for a new account",
                            style: TextStyle(
                                color: Color(0xff3277D8), fontSize: 16))
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onLoginClick() {
    String email = _emailController.text;
    String pass = _passController.text;
    //var authBloc = Myapp.of(context).authBloc;
    LoadingDialog.showLoadingDialog(context, "Loading...");
    authBloc.signIn(email, pass, () {
      LoadingDialog.hideLoadingDialog(context);

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Home()));
    }, (msg) {
      LoadingDialog.hideLoadingDialog(context);
      MsgDialog.showMsgDialog(context, "Sign-In", msg);
    });
  }
}

ThemeData _themeData(Brightness brightness) {
  return ThemeData(
    fontFamily: "Poppins",
    brightness: brightness,
    // Matches app icon color.
    primarySwatch: MaterialColor(0xFF4D8CFE, <int, Color>{
      50: Color(0xFFEAF1FF),
      100: Color(0xFFCADDFF),
      200: Color(0xFFA6C6FF),
      300: Color(0xFF82AFFE),
      400: Color(0xFF689DFE),
      500: Color(0xFF4D8CFE),
      600: Color(0xFF4684FE),
      700: Color(0xFF3D79FE),
      800: Color(0xFF346FFE),
      900: Color(0xFF255CFD),
    }),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      errorStyle: TextStyle(height: 0.75),
      helperStyle: TextStyle(height: 0.75),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      minimumSize: Size.fromHeight(40),
    )),
    scaffoldBackgroundColor:
        brightness == Brightness.dark ? Colors.black : null,
    cardColor:
        brightness == Brightness.dark ? Color.fromARGB(255, 28, 28, 30) : null,
    dialogTheme: DialogTheme(
      backgroundColor: brightness == Brightness.dark
          ? Color.fromARGB(255, 28, 28, 30)
          : null,
    ),
    highlightColor:
        brightness == Brightness.dark ? Color.fromARGB(255, 44, 44, 46) : null,
    splashFactory: NoSplash.splashFactory,
  );
}
