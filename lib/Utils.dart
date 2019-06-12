import 'package:flutter/material.dart';
import 'package:air_miles/Colors.dart';
class Utils{
  static double getRightLeftMargin(BuildContext context,double percentage){
    double size= MediaQuery.of(context).size.width ;
    print(size);
    double calculatedSize=(size*percentage)/100;
    return calculatedSize;

  }
  static bool IsvalidEmail(String email ){
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    );
    return emailRegExp.hasMatch(email);
  }
  static bool isValidPassword(String password){
    return (password.length>5);
  }
  static bool isPhoneNumber(String phone){
    return (phone.length>5 && phone.length<=15);
  }
  static showSnakBar(String msg,scaffoldKey,{bool error=true}){
    scaffoldKey.currentState.showSnackBar(
        SnackBar(
          backgroundColor: (error)?AppColors.snakBarErrorColor:AppColors.snakBarSuccessColor,
          content: Text(msg),
          duration: Duration(seconds: 2),
        ));
  }
  static Future<Null> submitDialog(BuildContext context) async {
    return await showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            children: <Widget>[
              Center(
                child: WillPopScope(
                  onWillPop: () async =>false,
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(AppColors.backgoundColorRed),
                  ),
                ),
              )
            ],
          );
        });
  }
  static fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }


}