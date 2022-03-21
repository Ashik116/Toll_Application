import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Pages/newUsers.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

import 'AdminUsers.dart';
import 'MohanondaUsers.dart';
import 'TeestaUsers.dart';

class Users extends StatefulWidget {
  //const Users({Key? key}) : super(key: key);
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  bool isLoading = true;

  double _height, _width;
  double _pixelRatio;
  bool large;
  bool medium;

  @override
  void initState() {
    // TODO: implement initState
    checkData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    if (isLoading) {
      return Container(
        color: providerThemeAndColor.backgroundColor,
        child: Center(
          child: Lottie.asset('assets/json/loading.json'),
        ),
      );
    } else {
      return DefaultTabController(
        length:3,
        child: Scaffold(
          backgroundColor: providerThemeAndColor.backgroundColor,
          appBar: AppBar(
            actions: [],
            iconTheme: IconThemeData(color: providerThemeAndColor.iconColor),
            backgroundColor: providerThemeAndColor.mainColor,
            title: Container(
                width: _width,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Users",
                        style:
                            TextStyle(color: providerThemeAndColor.textColor),
                      ),
                    ),
                  ],
                )),
            bottom: TabBar(
              labelStyle: TextStyle(color: providerThemeAndColor.textColor),
              indicatorColor: providerThemeAndColor.textColor,
              labelColor: providerThemeAndColor.textColor,
              tabs: [
                Tab(text: "Teesta"),
                Tab(text: "Mohanonda"),
                Tab(text: "Admin"),
                //  Tab(text: "GRAPH"),
                // Tab(text: "VIP PASS"),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              TeestaUsers(),
              MohanondaUsers(),
              AdminUsers(),
              // GraphTeesta(),
              //VipPassTeesta(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => newUsers()),
              );
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      );
    }

    /*if(isLoading){
      return Container(
        color: providerThemeAndColor.backgroundColor,
          child: Center(
            child: Lottie.asset('assets/json/loading.json'),
          ),
      );
    }else{
      return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: providerThemeAndColor.backgroundColor,
          appBar: AppBar(
            actions: [],
            iconTheme: IconThemeData(color: providerThemeAndColor.iconColor),
            backgroundColor: providerThemeAndColor.mainColor,
            title: Container(
                width: _width,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Users",
                        style:
                        TextStyle(color: providerThemeAndColor.textColor),
                      ),
                    ),
                   ],
                )),
            bottom: TabBar(
              labelStyle: TextStyle(color: providerThemeAndColor.textColor),
              indicatorColor: providerThemeAndColor.textColor,
              labelColor: providerThemeAndColor.textColor,
              tabs: [
                Tab(text: "Teesta"),
               // Tab(text: "Mohanonda"),
              //  Tab(text: "GRAPH"),
               // Tab(text: "VIP PASS"),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              TeestaUsers(),
             // MohanondaUsers(),
             // GraphTeesta(),
              //VipPassTeesta(),
            ],
          ),
        ),
      );
    }*/
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  void checkData() async {
    try {
      final FirebaseDatabase database = FirebaseDatabase.instance;
      DatabaseReference ref = database.reference().child('Teesta').child("Users");
      isLoading = false;
    } catch (e) {
      isLoading = true;
    }
  }
}
