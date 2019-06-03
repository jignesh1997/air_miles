import 'package:flutter/material.dart';
class Utils{
  static double getRightLeftMargin(BuildContext context,double percentage){
    double size= MediaQuery.of(context).size.width ;
    print(size);
    double calculatedSize=(size*percentage)/100;
    return calculatedSize;

  }

}