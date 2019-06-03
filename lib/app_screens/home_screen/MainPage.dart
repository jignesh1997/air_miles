import 'package:flutter/material.dart';
import 'package:air_miles/Colors.dart';
import 'package:air_miles/app_screens/home_screen/MyAccountScreen.dart';
import 'package:air_miles/app_screens/home_screen/PaymentScreen.dart';
import 'package:air_miles/app_screens/home_screen/VenueScreen.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 3,
      child: Scaffold(

        bottomNavigationBar: Container(
          color: Colors.white,
          child: TabBar(

            tabs: [

            Tab(
              icon: new Icon(Icons.business),
              child: Text("My Venues",style:TextStyle(fontSize: 10),),
            ),
            Tab(
              icon: new Icon(Icons.payment),
              child: Text("Payments",style:TextStyle(fontSize: 10),),
            ),
            Tab(icon: new Icon(Icons.perm_identity),
              child: Text("My Account",style:TextStyle(fontSize: 10),),

            )
          ],

            labelColor: AppColors.backgoundColorRed,


            unselectedLabelColor: Colors.black87,
            indicatorPadding: EdgeInsets.all(0.0),
            indicatorColor: Colors.white,

            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 0.1,




          ),
        ),



        body: Container(


          child: TabBarView(


            children: [

              Venue(),
              Payment(),
              MyAccount(),

            ],
          ),
        ),
        backgroundColor: Colors.black,

      ),
    );
  }
}
