import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
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
  //bool isLoading = true;

  //bool large;
  //bool medium;

  @override
  void initState() {
    // TODO: implement initState
    //checkData();
    //isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    return DefaultTabController(
      length:3,
      child: Scaffold(
        backgroundColor: providerThemeAndColor.backgroundColor,
        appBar: AppBar(
          actions: [],
          iconTheme: IconThemeData(color: providerThemeAndColor.iconColor),
          backgroundColor: providerThemeAndColor.mainColor,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: providerThemeAndColor.appBarColor,
              ),
            ),
          ),
          title: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Users",
                      style: TextStyle(color: providerThemeAndColor.textColor),
                    ),
                  ),
                ],
              )),
          bottom: TabBar(
            isScrollable: true,
            indicator: RectangularIndicator(
                bottomLeftRadius: 100,
                bottomRightRadius: 100,
                topLeftRadius: 100,
                topRightRadius: 100,
                color: providerThemeAndColor.indicatorColor,
                horizontalPadding: 5,
                verticalPadding: 5
            ),
            labelStyle: TextStyle(color: providerThemeAndColor.textColor),
            indicatorColor: providerThemeAndColor.textColor,
            labelColor: providerThemeAndColor.textColor,
            tabs: <Widget>[
              Tab(child: Text("Teesta", style: TextStyle(fontWeight: FontWeight.bold),),),
              Tab(child: Text("Mohanonda", style: TextStyle(fontWeight: FontWeight.bold),),),
              Tab(child: Text("Admin", style: TextStyle(fontWeight: FontWeight.bold),),),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            TeestaUsers(),
            MohanondaUsers(),
            AdminUsers(),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: providerThemeAndColor.highlighterTextColor,
          elevation: 10,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => newUsers()),
            );
          },
          label: Text('Add User'),
          icon: Icon(Icons.person_add),
          tooltip: 'Increment',
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  // void checkData() async {
  //   try {
  //     final CollectionReference userCollection = FirebaseFirestore.instance.collection('UserRoles');
  //     userCollection.get().then((value) {
  //       isLoading = false;
  //     });
  //     //final FirebaseDatabase database = FirebaseDatabase.instance;
  //     //DatabaseReference ref = database.reference().child('Teesta').child("Users");
  //     //isLoading = false;
  //   } catch (e) {
  //     isLoading = false;
  //     print(e.toString());
  //   }
  // }
}
