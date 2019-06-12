import 'package:flutter/material.dart';
import 'package:air_miles/Colors.dart';
import 'package:air_miles/Utils.dart';
import 'package:air_miles/app_screens/MerchantDetailsScreen.dart';

class MyAccount extends StatelessWidget {
  double LRmargin;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    LRmargin = Utils.getRightLeftMargin(context, 9);
    return Scaffold(
      body: Container(
        color: AppColors.backgoundColorgray,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 30, right: 5),
                      alignment: Alignment.topRight,
                      child: IconButton(
                          icon: Icon(Icons.notifications_none),
                          onPressed: () => {})),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 40, left: LRmargin),
                    child: Text(
                      "Mike Maxwell",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      color: Colors.black12,
                      margin: EdgeInsets.only(top: 15),
                      child: SizedBox(
                        height: 0.5,
                      )),
                  Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20, left: LRmargin),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: Container(
                              width: double.infinity,
                              child: Text(
                                "EMAIL",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                          ),
                          Flexible(
                              flex: 2,
                              child: Container(
                                width: double.infinity,
                                child: Text("mike@gmail.com",
                                    style: TextStyle(fontSize: 12)),
                              ))
                        ],
                      )),
                  Container(
                      width: double.infinity,
                      color: Colors.black12,
                      margin: EdgeInsets.only(top: 15),
                      child: SizedBox(
                        height: 0.5,
                      )),
                  Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20, left: LRmargin),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: Container(
                              width: double.infinity,
                              child: Text(
                                "PHONE NUMBER",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                          ),
                          Flexible(
                              flex: 2,
                              child: Container(
                                width: double.infinity,
                                child: Text("+971 45 2456 2345",
                                    style: TextStyle(fontSize: 12)),
                              ))
                        ],
                      )),
                  Container(
                      width: double.infinity,
                      color: Colors.black12,
                      margin: EdgeInsets.only(top: 15),
                      child: SizedBox(
                        height: 0.5,
                      )),
                  Container(
                    margin: EdgeInsets.only(
                        top: 30, left: LRmargin, right: LRmargin, bottom: 30),
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () => {},
                      color: AppColors.backgoundColorRed,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Container(
                        margin: EdgeInsets.only(top: 20, left: LRmargin),
                        child: Text(
                          "My Venues",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Flexible(
                      child: Container(
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(top: 20, left: LRmargin),
                          child: Transform.scale(
                            scale: 0.7,
                            child: FloatingActionButton(
                              onPressed: () => {
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>MerchantDetailsScreen()))

                              },
                              backgroundColor: AppColors.backgoundColorRed,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          )))
                ],
              ),
            ),
            Container(

            )

          ],
        ),
      ),
    );
  }
}
