import 'dart:io';

import 'package:air_miles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'LocationDetailsScreen.dart';

class MerchantDetailsScreen extends StatefulWidget {
  List<File> photos = [null];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MerchantDetailsState();
  }
}

class MerchantDetailsState extends State<MerchantDetailsScreen> {
  TextEditingController merchantTypeController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController openTimeController = TextEditingController();
  TextEditingController closeTimeController = TextEditingController();

//  MyList myList=MyList();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool isIOS;

  @override
  Widget build(BuildContext context) {
    isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    // widget.photos.add(ChildWidget());
    print("photo:LLL0" + widget.photos.length.toString());
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 60,
                width: 60,
                margin: EdgeInsets.only(left: 8, top: 36),
                child: Transform.scale(
                  scale: 0.7,
                  child: FloatingActionButton(
                    onPressed: () => {Navigator.pop(context)},
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 32,
                      color: Colors.black,
                    ),
                    backgroundColor: AppColors.backgoundColorDrakgray,
                    elevation: 0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 28, right: 28, top: 10),
                child: TextField(
                  cursorColor: AppColors.gray,
                  onTap: () => {
                        FocusScope.of(context).requestFocus(new FocusNode()),
                        _settingModalBottomSheet(context, ClickType.Merchant)
                      },
                  keyboardType: TextInputType.text,
                  enableInteractiveSelection: false,
                  controller: merchantTypeController,
                  decoration: InputDecoration(
                    labelText: "Merchant Type",
                    labelStyle: TextStyle(color: AppColors.gray),
                    contentPadding: EdgeInsets.all(2),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.gray)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.gray)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 28, right: 28, top: 20),
                child: TextField(
                  controller: categoryController,
                  enableInteractiveSelection: false,
                  onTap: () => {
                        FocusScope.of(context).requestFocus(FocusNode()),
                        _settingModalBottomSheet(context, ClickType.category)
                      },
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.gray)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: AppColors.gray,
                    )),
                    labelText: "Category",
                    labelStyle: TextStyle(color: AppColors.gray),
                    contentPadding: EdgeInsets.all(2),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 28, right: 28),
                child: Text(
                  "Merchant Details",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 133,
                  margin: EdgeInsets.only(left: 10),
                  child: ListView.separated(
                    itemBuilder: (context, pos) {
                      return (pos == 0)
                          ? InkWell(
                              onTap: () => {openBottomPickerDialog()},
                              child: Container(
                                  width: 101,

                                  decoration: BoxDecoration(
                                      color: AppColors.backgoundColorgray,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color:
                                              AppColors.backgoundColorDrakgray,
                                          width: 5)),
                                  child: Center(
                                      child: Icon(Icons.camera_alt, size: 24))),
                            )
                          : InkWell(
                              onTap: () => {removeListIteam(pos)},
                              child: ClipRRect(

                              borderRadius: new BorderRadius.circular(10),
                      child: Stack(
                        children: <Widget>[

                          Image.file(widget.photos[pos],height: 133,width: 101,),


                           Container(
                             height: 133,
                             width: 101,
                             alignment: Alignment.center,
                             child: ClipOval(
                              child: Container(
                                height: 30,
                                width: 30,

                                color: AppColors.backgoundColorRed,
                                child: Icon(Icons.close,color: Colors.white,),
                              ),
                              ),
                           )



                        ],
                      ),

                      ),
                      );
                    },
                    itemCount: widget.photos.length,
                    separatorBuilder: (context, pos) => SizedBox(
                      width: 10,
                    ),
                    scrollDirection: Axis.horizontal,
                  )),
              Container(
                margin: EdgeInsets.only(top: 10, right: 28, left: 28),
                child: TextField(
                  cursorColor: AppColors.gray,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.gray)),
                      contentPadding: EdgeInsets.all(2),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.gray)),
                      labelStyle: TextStyle(color: AppColors.gray),
                      labelText: "Venue Name"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25, right: 28, left: 28),
                child: Text(
                  "Venue Phone Number",
                  style: TextStyle(fontSize: 11, color: AppColors.gray),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 28),
                        child: TextField(
                          cursorColor: AppColors.gray,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.gray)),
                            contentPadding: EdgeInsets.all(2),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.gray)),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 28),
                        child: TextField(
                          cursorColor: AppColors.gray,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.gray)),
                            contentPadding: EdgeInsets.all(2),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.gray)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 28, right: 28),
                child: TextField(
                  cursorColor: AppColors.gray,
                  decoration: InputDecoration(
                      suffixText: "1\$",
                      contentPadding: EdgeInsets.all(2),
                      labelText: "Number of airmiles per USD",
                      labelStyle: TextStyle(color: AppColors.gray),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.gray)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.gray))),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 28, right: 28),
                child: TextField(
                  cursorColor: AppColors.gray,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(2),
                      labelText: "Venue Description",
                      labelStyle: TextStyle(color: AppColors.gray),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.gray),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.gray))),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 28, right: 28),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 4,
                      child: Container(
                        width: double.infinity,
                        child: Text(
                          "Opening\nHours",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: openTimeController,
                          enableInteractiveSelection: false,
                          onTap: () => {
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode()),
                                _showTimeDialog(context, ClickType.OPEN)
                              },
                          decoration: InputDecoration(
                              hintText: "Open",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.gray),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.gray))),
                        ),
                      ),
                    ),
                    Flexible(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: closeTimeController,
                            onTap: () => {
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode()),
                                  _showTimeDialog(context, ClickType.CLOSE)
                                },
                            enableInteractiveSelection: false,
                            decoration: InputDecoration(
                                hintText: "Close",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.gray),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.gray))),
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 28, right: 28, top: 20),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        child: Text(
                          "Minimum\nSpent",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 8),
                          child: TextField(
                            cursorColor: AppColors.gray,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.gray))),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 28, right: 28, top: 20, bottom: 20),
                child: RaisedButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LocationDetailsScreen()))
                      },
                  color: AppColors.backgoundColorRed,
                  child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Next",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _settingModalBottomSheet(context, ClickType click) {
    if (isIOS) {
      if (click == ClickType.Merchant) {
        merchantTypeController.text.length > 1
            ? ""
            : merchantTypeController.text = "Food & Drinks";
      }
      if (click == ClickType.category) {
        categoryController.text.length > 1
            ? ""
            : categoryController.text = "Food & Drinks";
      }
    }
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return getBottomListWidget(context, click);
        });
  }

  Widget getBottomListWidget(context, ClickType click) {
    if (isIOS) {
      return Container(
        height: MediaQuery.of(context).copyWith().size.height / 3,
        child: CupertinoPicker(
          itemExtent: 30,
          onSelectedItemChanged: (int index) => {
                if (index == 0)
                  {
                    if (click == ClickType.Merchant)
                      {merchantTypeController.text = "Food & Drinks"},
                    if (click == ClickType.category)
                      {categoryController.text = "Food & Drinks"}
                  },
                if (index == 1)
                  {
                    if (click == ClickType.Merchant)
                      {merchantTypeController.text = "Shopping"},
                    if (click == ClickType.category)
                      {categoryController.text = "Shopping"}
                  },
                if (index == 2)
                  {
                    if (click == ClickType.Merchant)
                      {merchantTypeController.text = "Life Style"},
                    if (click == ClickType.category)
                      {categoryController.text = "Life Style"}
                  }
              },
          backgroundColor: Colors.black12,
          children: <Widget>[
            Text(
              "Food & Drinks",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            Text(
              "Shopping",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            Text(
              "Life Style",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      );
    }
    return Container(
      child: new Wrap(
        children: <Widget>[
          new ListTile(
              leading: new Icon(
                Icons.fastfood,
                color: AppColors.backgoundColorRed,
              ),
              title: new Text('Food & Drinks'),
              onTap: () => {
                    if (click == ClickType.Merchant)
                      {merchantTypeController.text = "Food & Drinks"}
                    else
                      {categoryController.text = "Food & Drinks"},
                    Navigator.pop(context)
                  }),
          new ListTile(
            leading: new Icon(
              Icons.shopping_basket,
              color: AppColors.backgoundColorRed,
            ),
            title: new Text('Shopping'),
            onTap: () => {
                  if (click == ClickType.Merchant)
                    {merchantTypeController.text = "Shopping"}
                  else
                    {categoryController.text = "Shopping"},
                  Navigator.pop(context)
                },
          ),
          new ListTile(
            leading: new Icon(
              Icons.local_florist,
              color: AppColors.backgoundColorRed,
            ),
            title: new Text('Life Style'),
            onTap: () => {
                  if (click == ClickType.Merchant)
                    {merchantTypeController.text = "Life Style"}
                  else
                    {categoryController.text = "Life Style"},
                  Navigator.pop(context)
                },
          ),
        ],
      ),
    );
  }

  void _showTimeDialog(context, clickType) {
    if (isIOS) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext builder) {
            String time;
            return Container(
              height: MediaQuery.of(context).copyWith().size.height / 3,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                onDateTimeChanged: (DateTime) => {
                      time = DateTime.hour.toString() +
                          ":" +
                          DateTime.minute.toString(),
                      setTimeToView(time, clickType)
                    },
              ),
            );
          });
    } else {
      Future<TimeOfDay> selectedTime = showTimePicker(
        initialTime: TimeOfDay.now(),
        context: context,
      );
      String time;
      selectedTime.then((timeOfDay) => {
            time =
                timeOfDay.hour.toString() + ":" + timeOfDay.minute.toString(),
            setTimeToView(time, clickType)
          });
    }
  }

  setTimeToView(String time, ClickType clickType) {
    if (clickType == ClickType.OPEN) {
      openTimeController.text = time;
    } else if (clickType == ClickType.CLOSE) {
      closeTimeController.text = time;
    }
  }

  openBottomPickerDialog() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(
                        Icons.camera,
                        color: AppColors.backgoundColorRed,
                        size: 35,
                      ),
                      title: new Text('Camera'),
                      onTap: () => {
                            Navigator.pop(context),
                            openCamera(),
                          }),
                  new ListTile(
                    leading: new Icon(
                      Icons.perm_media,
                      color: AppColors.backgoundColorRed,
                      size: 35,
                    ),
                    title: new Text('Gallery'),
                    onTap: () => {Navigator.pop(context), openGallary()},
                  ),
                ],
              ),
            ),
          );
        });
  }

  openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
     addNewImage(image);
  }

  openGallary() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    addNewImage(image);
  }

  addNewImage(image) {
    print("photoLen:" + widget.photos.length.toString());
    //photos.add(ddt);
    setState(() {

      widget.photos.add(image);

    });

  }

  removeListIteam(int pos) {
    setState(() {
      widget.photos.removeAt(pos);
    });


  }
}


enum ClickType { Merchant, category, OPEN, CLOSE }
