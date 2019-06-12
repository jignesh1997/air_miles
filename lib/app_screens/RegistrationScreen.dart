import 'package:air_miles/bloc/registration/RegistrationBloc.dart';
import 'package:flutter/material.dart';
import 'package:air_miles/Colors.dart';
import 'package:air_miles/Utils.dart';
import 'package:air_miles/bloc/registration/RegistrationState.dart';
import 'package:air_miles/bloc/registration/RegistartionEvent.dart';
import 'package:air_miles/FirebaseDataBaseHelper.dart';

import 'package:air_miles/app_screens/home_screen/MainPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegistrationScreenState();
  }
}

class RegistrationScreenState extends State<RegistrationScreen> {
  RegistrationBloc _bloc = RegistrationBloc();
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController countryCode = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final FocusNode _nameNode=FocusNode();
  final FocusNode _emailNode=FocusNode();
  final FocusNode _passwordNode=FocusNode();
  final FocusNode _mobileNode=FocusNode();
  final FocusNode _confirmPasswordNode=FocusNode();
  double rLMargin;

  @override
  Widget build(BuildContext context) {
    rLMargin = Utils.getRightLeftMargin(context, 9);
    _showSnakbar(String msg,{bool isError=true}) {
      Future.delayed(const Duration(milliseconds: 2), () {
        if (_bloc.currentState.error == null) {
          Utils.submitDialog(context);
          //insert user
          FirebaseDataBaseHelper.insertUser(_bloc.currentState.fullname, _bloc.currentState.email,
              _bloc.currentState.mobile, _bloc.currentState.password).whenComplete(()=>{
                Navigator.pop(context),
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()))

          });


        }
        else {

          Utils.showSnakBar(_bloc.currentState.error, _scaffoldKey);
        }
      });}
      return Scaffold(
          key: _scaffoldKey,
          body: BlocBuilder(
              bloc: _bloc,
              builder: (BuildContext context, RegistrationState state) {
               
                return Container(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 8, top: 30),
                            child: Material(
                              shape: CircleBorder(),
                              color: AppColors.backgoundColorgray,
                              child: IconButton(
                                  icon: Icon(Icons.arrow_back_ios),
                                  onPressed: () => {Navigator.pop(context)}),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: rLMargin, top: 20),
                            child: Text(
                              "Create\nan Account",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  left: rLMargin, top: 25, right: rLMargin),
                              child: TextFormField(
                                onFieldSubmitted: (term){
                                  Utils.fieldFocusChange(context, _nameNode, _emailNode);
                                },
                                focusNode: _nameNode,

                                textInputAction: TextInputAction.next,
                                controller: fullname,
                                style: TextStyle(fontSize: 14),
                                cursorColor: AppColors.gray,
                                decoration: InputDecoration(
                                    labelText: "Full Name",
                                    labelStyle: TextStyle(
                                      color: AppColors.gray,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: AppColors.gray)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: AppColors.gray)),
                                    contentPadding: EdgeInsets.all(2)),
                              )),
                          Container(
                              margin: EdgeInsets.only(

                                  left: rLMargin, top: 25, right: rLMargin),
                              child: TextFormField(
                                onFieldSubmitted: (term){
                                  Utils.fieldFocusChange(context, _emailNode, _mobileNode);
                                },
                                focusNode: _emailNode,
                                textInputAction: TextInputAction.next,
                                controller: email,
                                style: TextStyle(fontSize: 14),
                                cursorColor: AppColors.gray,
                                decoration: InputDecoration(
                                    labelText: "Email",
                                    labelStyle: TextStyle(
                                      color: AppColors.gray,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: AppColors.gray)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: AppColors.gray)),
                                    contentPadding: EdgeInsets.all(2)),
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                  left: rLMargin, top: 25, right: rLMargin),
                              child: TextFormField(
                                onFieldSubmitted: (term){
                                  Utils.fieldFocusChange(context, _mobileNode, _passwordNode);

                                },
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                controller: mobile,
                                focusNode: _mobileNode,
                                style: TextStyle(fontSize: 14),
                                cursorColor: AppColors.gray,
                                decoration: InputDecoration(
                                    labelText: "Mobile",
                                    labelStyle: TextStyle(
                                      color: AppColors.gray,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: AppColors.gray)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: AppColors.gray)),
                                    contentPadding: EdgeInsets.all(2)),
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                  left: rLMargin, top: 25, right: rLMargin),
                              child: TextFormField(
                                onFieldSubmitted: (term){
                                  Utils.fieldFocusChange(context, _passwordNode, _confirmPasswordNode);
                                },
                                focusNode: _passwordNode,

                                controller: password,
                                textInputAction: TextInputAction.next,
                                style: TextStyle(fontSize: 14),
                                obscureText: true,
                                cursorColor: AppColors.gray,
                                decoration: InputDecoration(
                                    labelText: "Password",
                                    labelStyle: TextStyle(
                                      color: AppColors.gray,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: AppColors.gray)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: AppColors.gray)),
                                    contentPadding: EdgeInsets.all(2)),
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                  left: rLMargin, top: 25, right: rLMargin),
                              child: TextFormField(
                                onFieldSubmitted: (term){
                                  //Utils._fieldFocusChange(context, currentFocus, nextFocus)
                                },
                                focusNode: _confirmPasswordNode,
                                textInputAction: TextInputAction.done,
                                controller: confirmPassword,
                                style: TextStyle(fontSize: 14),
                                obscureText: true,
                                cursorColor: AppColors.gray,
                                decoration: InputDecoration(
                                    labelText: "Confirm Password",
                                    labelStyle: TextStyle(
                                      color: AppColors.gray,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: AppColors.gray)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: AppColors.gray)),
                                    contentPadding: EdgeInsets.all(2)),
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                  left: rLMargin, top: 25, right: rLMargin),
                              child: SizedBox(
                                width: double.infinity,
                                child: RaisedButton(


                                  onPressed: () =>
                                  {
                                    _bloc.dispatch(
                                        RegistrationSubmit(fullname.text,
                                            email.text, mobile.text,
                                            password.text,
                                            confirmPassword.text)),
                                    _showSnakbar("")


                                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()))
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    "Next",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: AppColors.backgoundColorRed,
                                ),
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                  left: rLMargin, top: 25, right: rLMargin),
                              child: Center(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: 'By registering you agree to ',
                                    style: TextStyle(
                                        fontSize: 10, color: AppColors.gray),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Terms & Conditions\n',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors
                                                  .backgoundColorRed,
                                              decoration:
                                              TextDecoration.underline)),
                                      TextSpan(text: 'and '),
                                      TextSpan(
                                          text: ' Privacy Policy.',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors
                                                  .backgoundColorRed,
                                              decoration:
                                              TextDecoration.underline))
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ));
              }));
    }

}