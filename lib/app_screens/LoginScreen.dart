import 'package:air_miles/Colors.dart';
import 'package:air_miles/app_screens/RegistrationScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:air_miles/Utils.dart';
import 'package:air_miles/app_screens/home_screen/MainPage.dart';

class LoginScreen extends StatelessWidget {
  final email = TextEditingController();
  final password = TextEditingController();
  double rLMargin;

  @override
  Widget build(BuildContext context) {
    rLMargin = Utils.getRightLeftMargin(context, 9);

    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Alert Dialog title"),
            content: new Text("Alert Dialog body"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: new Container(
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30, top: 40),
                child: Image.asset('images/app_icon_color.png'),
              ),
              Container(
                margin: EdgeInsets.only(left: rLMargin, top: 20),
                child: Text("Merchant Login",
                    style:
                        TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.only(left: rLMargin, top: 10),
                child: Text("Use your merchant account to login.",
                    style: TextStyle(fontSize: 15)),
              ),
              Container(
                  margin:
                      EdgeInsets.only(left: rLMargin, top: 20, right: rLMargin),
                  child: TextField(
                    cursorColor: AppColors.gray,
                    decoration: InputDecoration(
                        labelText: "Email ID",
                        contentPadding: EdgeInsets.all(2),
                        labelStyle: TextStyle(color: AppColors.gray),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.gray)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gray)
                    )
                    ),

                    controller: email,
                  )),
              Container(
                  margin:
                      EdgeInsets.only(left: rLMargin, top: 20, right: rLMargin),
                  child: TextField(
                    cursorColor: AppColors.gray,
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                        labelText: "Password",
                        contentPadding: EdgeInsets.all(2),
                        labelStyle: TextStyle(color: AppColors.gray),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.gray)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gray)
                    )
                    ),
                  )),
              Container(
                  margin:
                      EdgeInsets.only(left: rLMargin, top: 20, right: rLMargin),
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  )),
              Container(
                  margin:
                      EdgeInsets.only(left: rLMargin, top: 30, right: rLMargin),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () => {
                            debugPrint('movieTitle: '),
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage(),))
                          },
                      color: AppColors.backgoundColorRed,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
              Container(
                  margin:
                      EdgeInsets.only(left: rLMargin, top: 30, right: rLMargin),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "Dont have account?",
                          style: TextStyle(color: AppColors.gray, fontSize: 12),
                          children: [
                            TextSpan(
                                text: "Register Now",
                                style: TextStyle(
                                    color: AppColors.backgoundColorRed,
                                    fontSize: 12),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegistrationScreen()),
                                        )
                                      })
                          ]),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}