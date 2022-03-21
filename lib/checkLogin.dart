
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:toll_plaza/Pages/Admin/adminDashboard.dart';
import 'package:toll_plaza/Pages/homePage.dart';
import 'package:toll_plaza/Pages/loginPage.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';
import 'package:provider/provider.dart';

class CheckLogIn extends StatefulWidget {
  @override
  _CheckLogInState createState() => _CheckLogInState();
}

class _CheckLogInState extends State<CheckLogIn> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: context.watch<ThemeAndColorProvider>().backgroundColor,
      body: Center(
        child: Lottie.asset('assets/json/loading.json'),
      ),
    );
  }

  checkLogin(){
      FirebaseAuth.instance.authStateChanges()
          .listen((User user) async {
        try{
          /*if (user == null) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInPage()));
          }
          else if(user.displayName == null){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminDashboard()));
          }else{
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
          }*/
          if (user == null) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInPage()));
          }else if(user.email.toString()=="akijmia.cse@gmail.com"){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminDashboard()));
            print("Users: "+user.email.toString());
          } else{
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        }catch(e){

        }
      });
  }


}


