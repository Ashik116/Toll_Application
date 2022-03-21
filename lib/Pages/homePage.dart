import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Animation/itemClickAnimation.dart';
import 'package:toll_plaza/DatabaseModule/Chittagong/chittagongTodyDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Chittagong/previousChittagongData.dart';
import 'package:toll_plaza/DatabaseModule/Manikganj/manikganjTodyDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Manikganj/previousManikganjData.dart';
import 'package:toll_plaza/Pages/Chittagong/chittagongReportPage.dart';
import 'package:toll_plaza/Pages/Manikganj/manikganjReportPage.dart';
import 'package:toll_plaza/Pages/Mohanonda/mohanondaReportPage.dart';
import 'package:toll_plaza/Pages/Teesta/teestaReportPage.dart';
import 'package:toll_plaza/Pages/Users/Users.dart';
import 'package:toll_plaza/Pages/loginPage.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isRestricted = false;

 /*final dbRef = FirebaseDatabase.instance.reference();
  var currentUser = FirebaseAuth.instance.currentUser.uid.toString();
  var userEmail = FirebaseAuth.instance.currentUser.email;*/
  var userEmail;

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
            context, MaterialPageRoute(builder: (context) => LogInPage()),
            (route) => false);
        break;
      case 3:
        //getadmin();
        //var user = FirebaseAuth.instance.currentUser.email.toString();
        if(userEmail == "sakif@rocketmail.com"){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Users()),);
          //MaterialPageRoute(builder: (context)=>LogInPage());
        }else{
          snackBarMsg("You don't have permission to control Users!");
        }
        break;
    }
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
          value: 3,
          child: Text(
            "Users",
            style: TextStyle(
                color: context.read<ThemeAndColorProvider>().secondTextColor),
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

  getData() async {
    try {
      /*FirebaseAuth.instance.authStateChanges().listen((User user) {
        if (user != null) {
          if (user.email == "mamuntushi@gmail.com") {
            if (this.mounted) {
              // check whether the state object is in tree
              setState(() {
                isRestricted = true;
              });
            }
          }
        }
      });*/
      //fetch data from firebase


      context.read<TodayReportChittagongDatabase>().getShortReport();
      context.read<TodayReportChittagongDatabase>().getReport();
      context.read<PreviousReportChittagongDatabase>().getPreviousReport();

      context.read<TodayReportManikganjDatabase>().getShortReport();
      context.read<TodayReportManikganjDatabase>().getReport();
      context.read<PreviousReportManikganjDatabase>().getPreviousReport();

      //context.read<PreviousReportManikganjDatabase>().previousDataListManikganj;
      //print(context.read<TodayReportChittagongDatabase>().ctrlR);
      userEmail = FirebaseAuth.instance.currentUser.email;//test
      setState(() {});
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
   // declare();
    getData();

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
          actions: [popupMenuAppBar()],),


      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        color: providerColorAndTheme.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: StaggeredGridView.count(
            crossAxisCount: 2,
            children: [
              //-------------Dashboard Items-----------------
              ItemClickAnimation(
                //  password: "regnum@466",
                //route: isRestricted ? null : CharsindurReportPage(),

                scaleValue: .95,
                child: items(
                    "Charsindur", "assets/images/charshindo_logo-min.jpg"),
              ),
              ItemClickAnimation(
                password: "regnum@322",
                route: ChittagongReportPage(),
                scaleValue: 0.95,
                child: items(
                    "Chittagong", "assets/images/chittagong_logo-min.png"),
              ),
              ItemClickAnimation(
                password: "regnum@203",
                route: ManikganjReportPage(),
                scaleValue: .95,
                child: items("Manikganj", "assets/images/manikganj.jpg"),
              ),
              ItemClickAnimation(
                 password: "regnum@456",
                route: TeestaReportPage(),
                scaleValue: .95,
                child: items("Teesta", "assets/images/teesta.jpg"),
              ),
              ItemClickAnimation(
                  password: "regnum@124",
                route: MohanondaReportPage(),
                scaleValue: .95,
                child: items("Mohanonda", "assets/images/mohanonda.jpg"),
              ),
            ],
            staggeredTiles: [
              //-----------Dashboard Item Size------------------
              StaggeredTile.extent(1, 200),
              StaggeredTile.extent(1, 200),
              StaggeredTile.extent(1, 200),
              StaggeredTile.extent(1, 200),
              StaggeredTile.extent(2, 200),
            ],
          ),
        ),
      ),
    );
  }

  //---------------Dashboard Item Design-------------
  Widget items(text, image) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      clipBehavior: Clip.antiAlias,
      //color: context.watch<ThemeAndColorProvider>().mainColor,
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [Colors.lightBlue[200], Colors.lightGreen[200]]),
        ),
        child: Column(
          children: [
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: context.watch<ThemeAndColorProvider>().textColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void snackBarMsg(String loginErrorMessage) {
    final snackBar = SnackBar(
      content: Text(
        loginErrorMessage.toString(),
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

  void declare() async{
    //final dbRef = FirebaseDatabase.instance.reference();
   // var currentUser = FirebaseAuth.instance.currentUser.uid.toString();
    userEmail = FirebaseAuth.instance.currentUser.email;
  }

  /*void getadmin() {
    String st = "Admin";
    try{
      dbRef.child("Users").child(st).child(currentUser).once().then((DataSnapshot snapshot) {

        if(snapshot.value.toString()==userEmail){
          //return snapshot.value[currentUser].toString();
          setState(() {
            print("test: "+snapshot.value);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Users()),);
          });
        }
      });}catch(e){
      snackBarMsg("Please wait! Checking credentials.");
    }
  }*/
}
