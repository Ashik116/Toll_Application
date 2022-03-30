import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toll_plaza/Pages/homePage.dart';
import 'package:toll_plaza/Pages/loginPage.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';
import 'package:provider/provider.dart';
import 'Animation/loadingAnimation.dart';
import 'Pages/Admin/adminDashboardNew.dart';

class CheckLogIn extends StatefulWidget {
  @override
  _CheckLogInState createState() => _CheckLogInState();
}

class _CheckLogInState extends State<CheckLogIn> {

  @override
  void initState() {
    super.initState();
    checkLogin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ThemeAndColorProvider>().backgroundColor,
      body: Center(
        child: loadingAnimation(),
      ),
    );
  }

  checkLogin() {
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    FirebaseAuth.instance.authStateChanges().listen((User user) async {
      try {
        if (user == null) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInPage()));
        } else {
          final CollectionReference userCollection = FirebaseFirestore.instance.collection('UserRoles');

          userCollection.get().then((value) {
            value.docs.forEach((element) {
              if (element.data()['email'] == user.email) {
                if (element.data()['isUploader']) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminDashboardNew()));
                } else {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                }
              }
            });
          });
        }
      } catch (e) {
        print(e.toString());
      }
    });
  }

  // checkLoginOld(){
  //   FirebaseAuth.instance.authStateChanges().listen((User user) async {
  //     try {
  //       /*if (user == null) {
  //           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInPage()));
  //         }
  //         else if(user.displayName == null){
  //           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminDashboard()));
  //         }else{
  //           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
  //         }*/
  //       if (user == null) {
  //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInPage()));
  //       }else if(user.email.toString()=="akijmia.cse@gmail.com"){
  //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminDashboardNew()));
  //
  //       } else {
  //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
  //       }
  //     }catch(e) {
  //
  //     }
  //   });
  // }
}


