import 'package:flutter/material.dart';
import 'package:air_miles/Colors.dart';
import 'package:air_miles/app_screens/GetLocationMapScreen.dart';
import 'package:geocoder/geocoder.dart';

class LocationDetailsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LocationState();
  }
}
class LocationState extends State<LocationDetailsScreen>{
  var address = TextEditingController();
  var street = TextEditingController();
  var city = TextEditingController();
  var region = TextEditingController();
  var country = TextEditingController();
  var zip = TextEditingController();
  Address result;
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 8, top: 40),
                child: Material(
                  color: AppColors.backgoundColorgray,
                  shape: CircleBorder(),
                  child: IconButton(
                    onPressed: () =>
                    {
                      Navigator.pop(context)
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 28, top: 40),
                child: Text(
                  "Location\nDetails",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 28, top: 25, right: 28),
                child: TextField(
                  controller: address,
                  cursorColor: AppColors.gray,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(right: 4),
                      labelText: "Venue Address",
                      labelStyle: TextStyle(
                        color: AppColors.gray,
                      ),
                      suffixIcon: Container(
                        height: 5,
                        width: 5,
                        padding: const EdgeInsets.only(bottom: 0.2),
                        child: Transform.scale(
                          scale: 0.7,
                          child: FloatingActionButton(
                            child: Icon(
                              Icons.place,
                              color: Colors.white,
                            ),
                            backgroundColor: AppColors.backgoundColorRed,
                            onPressed: () => _getLocation(context),
                          ),
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.gray)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.gray))),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, right: 28, left: 28),
                child: TextField(
                  controller: street,
                  cursorColor: AppColors.gray,
                  decoration: InputDecoration(
                      labelText: "Venue Street",
                      labelStyle: TextStyle(color: AppColors.gray),
                      contentPadding: EdgeInsets.only(bottom: 2),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.gray),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.gray),
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, right: 28, left: 28),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(right: 12),
                        child: TextField(
                          controller: city,
                          cursorColor: AppColors.gray,

                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.gray)
                              ),
                              contentPadding: EdgeInsets.all(2),
                              labelText: "City",
                              labelStyle: TextStyle(
                                  color: AppColors.gray
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.gray)

                              )
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(left: 12),
                        child: TextField(
                          controller: region,
                          cursorColor: AppColors.gray,

                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.gray
                                ),

                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.gray
                                  )
                              ),
                              labelText: "Region",
                              labelStyle: TextStyle(
                                  color: AppColors.gray
                              )
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 28, left: 28, top: 20),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(right: 12),
                        child: TextField(
                          controller: country,
                          cursorColor: AppColors.gray,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.gray
                                  )
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.gray
                                ),


                              ),
                              labelStyle: TextStyle(
                                  color: AppColors.gray
                              ),
                              labelText: "Country"
                          ),
                        ),
                      ),

                    ),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(left: 12),
                        child: TextField(
                          controller: zip,
                          cursorColor: AppColors.gray,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.gray
                                )
                            )
                            ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.gray)
                            ),
                            labelText: "Zip Code",
                            labelStyle: TextStyle(
                                color: AppColors.gray
                            ),


                          ),


                        ),
                      ),

                    )

                  ],

                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 45, bottom: 10, right: 28, left: 28),
                width: double.infinity,
                child: RaisedButton(onPressed: () => {},
                  color: AppColors.backgoundColorRed,
                  child: Text("Finish", style: TextStyle(color: Colors.white),),
                  padding: EdgeInsets.all(20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  _getLocation(context) async{
    result= await Navigator.push(context,
        MaterialPageRoute(builder: (context) => GetLocationMapScreen())) as Address;
    setState(() {
      address.text=result.addressLine;
      country.text=result.countryName;
      zip.text=result.postalCode;
      city.text=result.locality;
      street.text=result.thoroughfare;
      region.text=result.subLocality;
    });

  }
  
  
}