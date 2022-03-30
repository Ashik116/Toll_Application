import 'dart:io';
import 'package:excel/excel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/Pages/loginPage.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';
import 'package:file_picker/file_picker.dart';

import '../../ThemeAndColors/themeAndColors.dart';

class AdminDashboardNew extends StatefulWidget {
  @override
  _AdminDashboardStateNew createState() => _AdminDashboardStateNew();
}

class _AdminDashboardStateNew extends State<AdminDashboardNew> {
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

  //test
  int ld_axle2;
  int ld_axle3;
  int ld_axle4;
  int ld_axle5;
  int ld_axle6;
  int ld_axle7;

  int ctrl_axle2;
  int ctrl_axle3;
  int ctrl_axle4;
  int ctrl_axle5;
  int ctrl_axle6;
  int ctrl_axle7;

  int overld;
  var overload = [];

  int initialIndex = 0;

  DateTime selectedDate = DateTime.now();
  var ctrlRList = [];
  var _selectedBtnText = "chittagong2";//test

  TextStyle textStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    bool isDark = providerThemeAndColor.darkTheme;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: providerThemeAndColor.backgroundColor,
      appBar: AppBar(
          backgroundColor: providerThemeAndColor.mainColor,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: isDark ? [Colors.black] : [Colors.lightBlue[200], Colors.lightGreen[200]]
              ),
            ),
          ),
          title: Text(
            "Axle Load Control Station",
            style: TextStyle(color: providerThemeAndColor.textColor),
          ),
          actions: [popupMenuAppBar()]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isLoading = true;
          });
          _openFileExplorer();
          // print(path);
        },
        // label: Text(
        //   'Select File',
        //   style: TextStyle(
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        child: Icon(Icons.cloud_upload_rounded),
        backgroundColor: isDark ? Colors.green.shade900 : Colors.green.shade400,
      ),
      body: isLoading ? Container(
        color: providerThemeAndColor.backgroundColor,
        child: Center(
          child: loadingAnimation(),
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
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3,
                        color: isDark ? Colors.grey : Colors.green.shade900),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: 'Name: ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: providerThemeAndColor.secondTextColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: fileName.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            color: providerThemeAndColor.secondTextColor,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width * 0.22,
                          width: MediaQuery.of(context).size.width * 0.22,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90),
                            ),
                            color: isDark ?  Colors.grey.shade900:providerThemeAndColor.backgroundColor,
                            elevation: 20,
                            child: Center(
                              child: Text(
                                '$regular',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: providerThemeAndColor.secondTextColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Regular',
                          style: TextStyle(
                            fontSize: 17,
                            color: providerThemeAndColor.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width * 0.22,
                          width: MediaQuery.of(context).size.width * 0.22,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90),
                            ),
                            color: isDark ?  Colors.grey.shade900:providerThemeAndColor.backgroundColor,
                            elevation: 20,
                            child: Center(
                              child: Text(
                                '$ctlR',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: providerThemeAndColor.secondTextColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Ctrl+R',
                          style: TextStyle(
                            fontSize: 17,
                            color: providerThemeAndColor.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * 0.22,
                      width: MediaQuery.of(context).size.width * 0.22,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(90),
                        ),
                        color: isDark ?  Colors.grey.shade900:providerThemeAndColor.backgroundColor,
                        elevation: 20,
                        child: Center(
                          child: Text(
                            '$regular',
                            style: TextStyle(
                              fontSize: 20,
                              color: isDark ? Colors.green.shade900 : Colors.green.shade400,
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 17,
                        color: isDark ? Colors.lightGreen.shade900 : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                //card(text: "Total: $regular",color: Colors.green),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3,
                        color: isDark ? Colors.grey : Colors.green.shade900),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: InkWell(
                          onTap: () => _selectDate(context),
                          child: Column(
                            children: [
                              Text(
                                'Date',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: isDark ? Colors.green.shade900 : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_rounded,
                                    color: providerThemeAndColor.highlighterTextColor,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    DateFormat("dd-MM-yyyy").format(selectedDate),
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: providerThemeAndColor.secondTextColor,),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: [
                    Text(
                      'Axle Station',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: isDark ? Colors.green.shade900 : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 5,),
                    ToggleSwitch(
                      initialLabelIndex: initialIndex,
                      fontSize: 16,
                      minWidth: MediaQuery.of(context).size.width * 0.3,
                      cornerRadius: 20.0,
                      activeBgColor: [providerThemeAndColor.toggleActiveColor],
                      activeFgColor: Colors.white,
                      inactiveBgColor: providerThemeAndColor.toggleInactiveColor,
                      inactiveFgColor: isDark ? Colors.white30 : Colors.grey.shade900,
                      totalSwitches: 3,
                      animate: true,
                      //radiusStyle: true,
                      curve: Curves.decelerate,
                      labels: ['Chittagong', 'Manikganj', 'Netrokona'],
                      onToggle: (index) {
                        initialIndex = index;
                        if (index == 0) {
                          _selectedBtnText = "chittagong2";
                        } else if (index == 1) {
                          _selectedBtnText = "manikganj";
                        } else {
                          _selectedBtnText = 'netrokona';
                        }
                      },
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Expanded(
                    //       child: ListTile(
                    //         title: Text(
                    //             'Chittagong',
                    //             style: TextStyle(
                    //                 fontSize: 16,
                    //                 fontWeight: FontWeight.bold,
                    //                 color: providerColorAndTheme.secondTextColor
                    //             )
                    //         ),
                    //         leading: Theme(
                    //           data: Theme.of(context).copyWith(
                    //             unselectedWidgetColor: Colors.red,
                    //           ),
                    //           child: Radio(
                    //             value: RadioBtn.chittagong,
                    //             groupValue: _selectedBtn,
                    //             onChanged: (RadioBtn value) {
                    //               setState(() {
                    //                 _selectedBtn = value;
                    //                 _selectedBtnText = "chittagong";
                    //               });
                    //             },
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: ListTile(
                    //         title: Text('Manikganj',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: providerColorAndTheme.secondTextColor)),
                    //         leading: Theme(
                    //           data: Theme.of(context).copyWith(
                    //             unselectedWidgetColor: Colors.red,
                    //           ),
                    //           child: Radio(
                    //             value: RadioBtn.manikganj,
                    //             groupValue: _selectedBtn,
                    //             onChanged: (RadioBtn value) {
                    //               setState(() {
                    //                 _selectedBtn = value;
                    //                 _selectedBtnText = "manikganj";
                    //               });
                    //             },
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                ElevatedButton(
                  onPressed: total == null ? null : () {
                    if(total != null || total > 0){
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
                    "Upload",
                    style: TextStyle(
                        color: isDark ? Colors.green.shade900 : Colors.black,
                        fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: isDark ? Colors.red:Colors.red.shade400,
                      elevation: 5,
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 40),
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 20
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openFileExplorer() async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles(allowedExtensions: ['xlsx'], type: FileType.custom);
      path = File(result.files.single.path);
      fileName = result.files.single.name;

      if (result != null && _selectedBtnText == 'chittagong2') { //test chittagong
        //path = File(result.files.single.path);
        //fileName = result.files.single.name;
        _readExcelChittagong();

      } else if (result != null && _selectedBtnText == 'manikganj') {
        //path = File(result.files.single.path);
        //fileName = result.files.single.name;
        _readExcelManikganj();
        // User canceled the picker
      } else {
        _readExcelNetrokona();
      }
      if(mounted) {
        setState(() {
          isLoading = false;
        });
      }
    } catch(e) {
      setState(() {
        isLoading = false;
      });
      final snackBar = SnackBar(
        content: Text(
          'Please select a file',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
          data: context.watch<ThemeAndColorProvider>().darkTheme ? ThemeData.dark() : ThemeData.light(),
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
      color: context.watch<ThemeAndColorProvider>().popupColor.withOpacity(0.9),
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
          bool isDark = context.read<ThemeAndColorProvider>().darkTheme ? false : true;
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

  void _readExcelManikganj() async {
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
              ctrlRList.add(Map.fromIterables([
                'a',
                'b',
                'c',
                'd',
                'e',
                'f',
                'g',
                'h',
                'i',
                'j',
                'k',
                'l',
                'm',
                'n',
                'o',
                'p',
                'q',
                'r'
              ], row.getRange(0, 18)));

              ctlR++;
            }
            if (row[4] == "Truck 2 Axle") axle2++;
            else if (row[4] == "Truck 3 Axle") axle3++;
            else if (row[4] == "Truck 4 Axle") axle4++;
            else if (row[4] == "Truck 5 Axle") axle5++;
            else if (row[4] == "Truck 6 Axle") axle6++;
            else if (row[4] == "Truck 7 Axle") axle7++;
            total++;
          }catch(e){

          }
        }
      }
      //print(ctrlRList);
      regular = total - ctlR;
    }
  }

  void _readExcelNetrokona() async {
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
              ctrlRList.add(Map.fromIterables([
                'a',
                'b',
                'c',
                'd',
                'e',
                'f',
                'g',
                'h',
                'i',
                'j',
                'k',
                'l',
                'm',
                'n',
                'o',
                'p',
                'q',
                'r'
              ], row.getRange(0, 18)));

              ctlR++;
            }
            if (row[4] == "Truck 2 Axle") axle2++;
            else if (row[4] == "Truck 3 Axle") axle3++;
            else if (row[4] == "Truck 4 Axle") axle4++;
            else if (row[4] == "Truck 5 Axle") axle5++;
            else if (row[4] == "Truck 6 Axle") axle6++;
            else if (row[4] == "Truck 7 Axle") axle7++;
            total++;
          }catch(e){

          }
        }
      }
      //print(ctrlRList);
      regular= total - ctlR;
    }
  }

  void _readExcelChittagong() async {
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

      ld_axle2 = 0;
      ld_axle3 = 0;
      ld_axle4 = 0;
      ld_axle5 = 0;
      ld_axle6 = 0;
      ld_axle7 = 0;

      ctrl_axle2 = 0;
      ctrl_axle3 = 0;
      ctrl_axle4 = 0;
      ctrl_axle5 = 0;
      ctrl_axle6 = 0;
      ctrl_axle7 = 0;

      overld = 0;
      ctrlRList.clear();
      overload.clear();
      for (var table in excel.tables.keys) {
        for (var row in excel.tables[table].rows) {
          // print(row.toString());
          if (row[8] == 'N/A') {
            //print(row);
            // print();
            /*ctrlRList.add(Map.fromIterables([
              'a',
              'b',
              'c',
              'd',
              'e',
              'f',
              'g',
              'h',
              'i',
              'j',
              'k',
              'l',
              'm',
              'n',
              'o',
              'p',
              'q',
              'r'
            ], row.getRange(0, 18)));*/

            if (row[3] == "Truck 2 Axle") {
              ctrl_axle2++;
            } else if (row[3] == "Truck 3 Axle") {
              ctrl_axle3++;
            } else if (row[3] == "Truck 4 Axle") {
              ctrl_axle4++;
            } else if (row[3] == "Truck 5 Axle") {
              ctrl_axle5++;
            } else if (row[3] == "Truck 6 Axle") {
              ctrl_axle6++;
            } else if (row[3] == "Truck 7 Axle") {
              ctrl_axle7++;
            }
            ctlR++;
          }
          try {
            if (double.parse((row[8])) <= (row[9] + 500)) {
              overload.add(Map.fromIterables([
                'a',
                'b',
                'c',
                'd',
                'e',
                'f',
                'g',
                'h',
                'i',
                'j',
                'k',
                'l',
                'm',
                'n',
                'o',
                'p',
                'q',
                'r'
              ], row.getRange(0, 18)));

              if (row[3] == "Truck 2 Axle") {
                ld_axle2++;
              } else if (row[3] == "Truck 3 Axle") {
                ld_axle3++;
              } else if (row[3] == "Truck 4 Axle") {
                ld_axle4++;
              } else if (row[3] == "Truck 5 Axle") {
                ld_axle5++;
              } else if (row[3] == "Truck 6 Axle") {
                ld_axle6++;
              } else if (row[3] == "Truck 7 Axle") {
                ld_axle7++;
              }
              overld++;
            }
          } catch (e) {

          }

          if (row[3] == "Truck 2 Axle") {
            total++;
            axle2++;
          } else if (row[3] == "Truck 3 Axle") {
            total++;
            axle3++;
          } else if (row[3] == "Truck 4 Axle") {
            total++;
            axle4++;
          } else if (row[3] == "Truck 5 Axle") {
            total++;
            axle5++;
          } else if (row[3] == "Truck 6 Axle") {
            total++;
            axle6++;
          } else if (row[3] == "Truck 7 Axle") {
            total++;
            axle7++;
          }

          //total++;
        }
      }
      //print(ctrlRList);
      regular = total - ctlR;
    }
  }

  _firebaseUpload() {
    try {
      final databaseReference = FirebaseDatabase.instance.reference();
      //print("ok");
      var date = DateFormat("dd-MM-yyyy").format(selectedDate);
      databaseReference
          .child(_selectedBtnText.toString())
          .child(date)
          .child("RegularReport")
          .update({
        "axel2": axle2.toString(),
        "axel3": axle3.toString(),
        "axel4": axle4.toString(),
        "axel5": axle5.toString(),
        "axel6": axle6.toString(),
        "axel7": axle7.toString(),
        "axelT": total.toString(),
      });

      databaseReference
          .child(_selectedBtnText.toString())
          .child(date)
          .child("notOverload")
          .update({
        "ld_axel2": ld_axle2.toString(),
        "ld_axel3": ld_axle3.toString(),
        "ld_axel4": ld_axle4.toString(),
        "ld_axel5": ld_axle5.toString(),
        "ld_axel6": ld_axle6.toString(),
        "ld_axel7": ld_axle7.toString(),
      });
      databaseReference
          .child(_selectedBtnText.toString())
          .child(date)
          .child("short")
          .update({
        "ctrlR": ctlR.toString(),
        "regular": regular.toString(),
        "total": total.toString(),
        "overld": overld.toString()
      });
      if(_selectedBtnText == "chittagong2") {
        databaseReference
            .child(_selectedBtnText.toString())
            .child(date)
            .child("ctrlReport")
            .update({
          "ctrl_axel2": ctrl_axle2.toString(),
          "ctrl_axel3": ctrl_axle3.toString(),
          "ctrl_axel4": ctrl_axle4.toString(),
          "ctrl_axel5": ctrl_axle5.toString(),
          "ctrl_axel6": ctrl_axle6.toString(),
          "ctrl_axel7": ctrl_axle7.toString(),
        });
      } else if (_selectedBtnText == "manikganj") {
        databaseReference
            .child(_selectedBtnText.toString())
            .child(date)
            .child("ctrlReport")
            .set(ctrlRList);
      } else if (_selectedBtnText == "netrokona") {
        databaseReference
            .child(_selectedBtnText.toString())
            .child(date)
            .child("ctrlReport")
            .set(ctrlRList);
      }
      snackBarMsg("Upload Successful", Colors.green.shade900);
    } catch (e) {
      snackBarMsg("Upload Failed", Colors.red);
    }
  }

  void snackBarMsg(errorMessage, color) {
    //print("ok");
    final snackBar = SnackBar(
      content: Text(
        errorMessage.toString(),
        style: TextStyle(color: color),
      ),
      // action: SnackBarAction(
      //   label: 'Undo',
      //   onPressed: () {
      //     // Some code to undo the change.
      //   },
      // ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

//enum RadioBtn { chittagong, manikganj }