import 'dart:convert';
import 'dart:io';
import 'package:excel/excel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Pages/loginPage.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';
import 'package:file_picker/file_picker.dart';

import '../../ThemeAndColors/themeAndColors.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  var siteName;
  File path;
  var fileName;
  int regular;
  int ctlR;
  int total;
  int axle2;
  int axle3;
  int axle4;
  int axle5;
  int axle6;
  int axle7;



  DateTime selectedDate = DateTime.now();
  var ctrlRList = [];
  RadioBtn _selectedBtn = RadioBtn.chittagong;
  var _selectedBtnText = "chittagong";

  TextStyle textStyle = TextStyle(fontSize: 16,fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerColorAndTheme = Provider.of<ThemeAndColorProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: providerColorAndTheme.backgroundColor,
      appBar: AppBar(
          backgroundColor: providerColorAndTheme.mainColor,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.lightBlue[200], Colors.lightGreen[200]]
              ),
            ),
          ),
          title: Text(
            "Dashboard", 
            style: TextStyle(color: providerColorAndTheme.textColor),
          ),
          actions: [popupMenuAppBar()]),
      body: isLoading?Container(
        color: providerColorAndTheme.backgroundColor,
        child: Center(
          child: Lottie.asset('assets/json/loading.json'),
        ),
      ):Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  color: Colors.green,
                  elevation: 10,
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    _openFileExplorer();
                    // print(path);

                  },
                  child: Text(
                    "Open File Manager",
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        text: 'Name : ',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: fileName.toString(),
                              style: TextStyle(fontStyle: FontStyle.italic)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    card(text: "Regular: $regular",color: Colors.blue),
                    card(text: "ctl+R: $ctlR",color: Colors.red),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                card(text: "Total: $regular",color: Colors.green),
                SizedBox(
                  height: 10.0,
                ),
                Card(
                  color: Colors.green,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Date : ",style: textStyle,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => _selectDate(context),
                          child: Text(
                            DateFormat("dd-MM-yyyy").format(selectedDate),
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text('Chittagong',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: providerColorAndTheme.secondTextColor)),
                        leading: Theme(
                          data: Theme.of(context).copyWith(
                            unselectedWidgetColor: Colors.red,
                          ),
                          child: Radio(
                            value: RadioBtn.chittagong,
                            groupValue: _selectedBtn,
                            onChanged: (RadioBtn value) {
                              setState(() {
                                _selectedBtn = value;
                                _selectedBtnText = "chittagong";
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('Manikganj',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: providerColorAndTheme.secondTextColor)),
                        leading: Theme(
                          data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.red,
                          ),
                          child: Radio(
                            value: RadioBtn.manikganj,
                            groupValue: _selectedBtn,
                            onChanged: (RadioBtn value) {
                              setState(() {
                                _selectedBtn = value;
                                _selectedBtnText = "manikganj";
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                total==null?Container():RaisedButton(
                  onPressed: () {
                    if(total != null || total>0){
                      _firebaseUpload();
                      setState(() {
                        regular = null;
                        ctlR= null;
                        total= null;
                        axle2= null;
                        axle3= null;
                        axle4= null;
                        axle5= null;
                        axle6= null;
                        axle7= null;
                        ctrlRList.clear();
                      });
                    }
                  }, // Refer step 3
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openFileExplorer() async {
    FilePickerResult result = await FilePicker.platform
        .pickFiles(allowedExtensions: ['xlsx'], type: FileType.custom);

    if (result != null && _selectedBtnText=='chittagong') {
      path = File(result.files.single.path);
      fileName = result.files.single.name;
      _readExcel();

    } else {
      path = File(result.files.single.path);
      fileName = result.files.single.name;
      _readExcel2();
      // User canceled the picker
    }
    if(mounted){
      setState(() {
        isLoading = false;
      });
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: context.watch<ThemeAndColorProvider>().darkTheme
              ? ThemeData.dark()
              : ThemeData.light(),
          child: child,
        );
      },
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Widget card({text, color}){
    return Card(
      color: color,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width*.45,
        child: Text(text,style: textStyle,),
      ),
    );
  }

  Widget popupMenuAppBar() {
    return PopupMenuButton(
      color: context.watch<ThemeAndColorProvider>().secondColor,
      elevation: 5,
      onSelected: (value) {
        handlePopupMenu(value);
      },
      icon: Icon(
        Icons.more_vert,
        color: context.watch<ThemeAndColorProvider>().iconColor,
      ),
      padding: EdgeInsets.all(0),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dark",
                style: TextStyle(
                    color:
                        context.read<ThemeAndColorProvider>().secondTextColor),
              ),
              Switch(
                inactiveThumbColor:
                    context.read<ThemeAndColorProvider>().iconColor,
                activeTrackColor:
                    context.read<ThemeAndColorProvider>().mainColor,
                activeColor: context.read<ThemeAndColorProvider>().iconColor,
                value: context.read<ThemeAndColorProvider>().darkTheme,
                onChanged: (value) {
                  setState(() {
                    context.read<ThemeAndColorProvider>().setDarkTheme(value);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            "Logout",
            style: TextStyle(
                color: context.read<ThemeAndColorProvider>().secondTextColor),
          ),
        ),
      ],
    );
  }

  void handlePopupMenu(int value) {
    switch (value) {
      case 1:
        setState(() {
          bool isDark =
              context.read<ThemeAndColorProvider>().darkTheme ? false : true;
          context.read<ThemeAndColorProvider>().setDarkTheme(isDark);
        });

        break;
      case 2:
        FirebaseAuth.instance.signOut();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LogInPage()),
            (route) => false);
        break;
    }
  }

  void _readExcel() async {
    if (path != null) {
      var excel = Excel.decodeBytes(path.readAsBytesSync());
      ctlR = 0;
      total = 0;
      axle2 = 0;
      axle3 = 0;
      axle4 = 0;
      axle5 = 0;
      axle6 = 0;
      axle7 = 0;
      ctrlRList.clear();
      for (var table in excel.tables.keys) {
        for (var row in excel.tables[table].rows) {
          // print(row.toString());
          if (row[8] == 'N/A') {
            //print(row);
           // print();

           ctrlRList.add(Map.fromIterables(['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r'], row.getRange(0, 18)));

           ctlR++;
          }
          if (row[3] == "Truck 2 Axle") axle2++;
          else if (row[3] == "Truck 3 Axle") axle3++;
          else if (row[3] == "Truck 4 Axle") axle4++;
          else if (row[3] == "Truck 5 Axle") axle5++;
          else if (row[3] == "Truck 6 Axle") axle6++;
          else if (row[3] == "Truck 7 Axle") axle7++;
          total++;
        }
      }
      print(ctrlRList);
      regular= total-ctlR;
    }
  }
  void _readExcel2() async {
    if (path != null) {
      var excel = Excel.decodeBytes(path.readAsBytesSync());
      ctlR = 0;
      total = 0;
      axle2 = 0;
      axle3 = 0;
      axle4 = 0;
      axle5 = 0;
      axle6 = 0;
      axle7 = 0;
      ctrlRList.clear();
      for (var table in excel.tables.keys) {
        for (var row in excel.tables[table].rows) {
          // print(row.toString());
          try{
            if (double.parse((row[9]))<= (row[10]+500)) {
              ctrlRList.add(Map.fromIterables(['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r'], row.getRange(0, 18)));

              ctlR++;
            }
            if (row[4] == "Truck 2 Axle") axle2++;
            else if (row[4] == "Truck 3 Axle") axle3++;
            else if (row[4] == "Truck 4 Axle") axle4++;
            else if (row[4] == "Truck 5 Axle") axle5++;
            else if (row[4] == "Truck 6 Axle") axle6++;
            else if (row[4] == "Truck 7 Axle") axle7++;
            total++;
          }catch(e){}
        }
      }
      print(ctrlRList);
      regular= total-ctlR;
    }
  }

  _firebaseUpload() {
    try{
      final databaseReference = FirebaseDatabase.instance.reference();
      //print("ok");
      var date = DateFormat("dd-MM-yyyy").format(selectedDate);
      databaseReference.child(_selectedBtnText.toString()).child(date).child("RegularReport").update({
        "axel2" : axle2.toString(),
        "axel3" : axle3.toString(),
        "axel4" : axle4.toString(),
        "axel5" : axle5.toString(),
        "axel6" : axle6.toString(),
        "axel7" : axle7.toString(),
        "axelT" : total.toString(),
      });
      databaseReference.child(_selectedBtnText.toString()).child(date).child("short").update({
        "ctrlR" : ctlR.toString(),
        "regular" : regular.toString(),
        "total" : total.toString(),
      });
      databaseReference.child(_selectedBtnText.toString()).child(date).child("ctrlReport").set(ctrlRList);
      snackBarMsg("Successfully Update");
    }catch(e){
      snackBarMsg("Data upload to firebase get error");
    }
  }

  void snackBarMsg(errorMessage) {
    //print("ok");
    final snackBar = SnackBar(
      content: Text(
        errorMessage.toString(),
        style: TextStyle(color: Colors.red),
      ),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}

enum RadioBtn { chittagong, manikganj }