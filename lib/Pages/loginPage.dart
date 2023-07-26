import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/Pages/Charsindur/Charsindur%20User%20Page/charsindurHomePage.dart';
import 'package:toll_plaza/Pages/Mohanonda/Mohanonda%20User%20Page/mohanondaHomePage.dart';
import 'package:toll_plaza/Pages/Teesta/Teesta%20User%20Page/teestaHomePage.dart';
import 'package:toll_plaza/Pages/homePage.dart';
import 'package:toll_plaza/Provider/firebaseDatabase.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

import 'Admin/adminDashboardNew.dart';
import 'Bhangga/bhanggaHomePage.dart';
import 'Dhaleshwari/dhaleshwariHomePage.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  getData() async {
    await FireDatabaseMethod().getUserInfo(userName).then((snapshot) {
      allowedData = snapshot.document.data["access"];
    });
  }

  bool _passwordHide = true;
  var userName;
  var allowedData;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var password;
  var data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: providerThemeAndColor.backgroundColor,
      body: _isLoading
          ? loadingAnimation()
          : Container(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset("assets/images/regnum.png", height: 150),
                        SizedBox(
                          height: 10,
                        ),
                        Form(
                          key: _formKey,
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            clipBehavior: Clip.antiAlias,
                            child: Container(
                              decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 16.0, left: 30, right: 30),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      onChanged: (value) {
                                        setState(() {
                                          userName = value;
                                        });
                                      },
                                      key: Key('userName'),
                                      decoration: InputDecoration(
                                          labelText: 'Username',
                                          hintText: 'example@gmail.com',
                                          prefixIcon: Icon(Icons.email_rounded),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.auto,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30))),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Enter Email";
                                        } else if (!RegExp(
                                                r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                            .hasMatch(value)) {
                                          return "Invalid Mail Address";
                                        } else
                                          return null;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      onChanged: (value) {
                                        setState(() {
                                          password = value;
                                        });
                                      },
                                      key: Key("password"),
                                      obscureText: _passwordHide,
                                      decoration: InputDecoration(
                                          labelText: 'Password',
                                          prefixIcon:
                                              Icon(Icons.vpn_key_rounded),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.auto,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          suffixIcon: IconButton(
                                            icon: _passwordHide
                                                ? Icon(Icons.visibility_rounded)
                                                : Icon(Icons
                                                    .visibility_off_rounded),
                                            onPressed: () {
                                              setState(() {
                                                _passwordHide = !_passwordHide;
                                              });
                                            },
                                          )),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Enter Password";
                                        }
                                        return null;
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 25.0),
                                      child: ElevatedButton(
                                        key: Key('submit'),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.lightGreen,
                                            elevation: 5,
                                            minimumSize:
                                                Size(double.infinity, 50),
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 20),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            )),
                                        onPressed: () {
                                          FocusScope.of(context).unfocus();
                                          // Validate returns true if the form is valid, or false
                                          // otherwise.
                                          if (_formKey.currentState
                                              .validate()) {
                                            logIn();
                                            setState(() {
                                              _isLoading = true;
                                            });
                                          }
                                        },
                                        child: Text('LOGIN'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  logIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: userName.toString(), password: password.toString());
      if (userCredential.user == null) {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LogInPage()));
      } else {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        await sharedPreferences.setString('user', userCredential.user.email);

        final CollectionReference userCollection =
            FirebaseFirestore.instance.collection('UserRoles');
        userCollection.get().then((value) {
          print("----------data-fetched: login page");
          bool found = false;
          int i = 0;
          int length = value.size;
          value.docs.forEach((element) async {
            i++;
            if (element.id == userCredential.user.uid) {
              found = true;

              await sharedPreferences.setBool(
                  'isAdmin', element.data()['isAdmin']);
              await sharedPreferences.setBool(
                  'isTeesta', element.data()['isTeesta']);
              await sharedPreferences.setBool(
                  'isMohanonda', element.data()['isMohanonda']);
              await sharedPreferences.setBool(
                  'isBhanga', element.data()['isBhanga']);
              await sharedPreferences.setBool(
                  'isDhaleshwari', element.data()['isDhaleshwari']);
              await sharedPreferences.setBool('isCharsindur', element.data()['isCharsindur']);
              await sharedPreferences.setBool(
                  'isManikganj', element.data()['isManikganj']);
              await sharedPreferences.setBool(
                  'isChittagong', element.data()['isChittagong']);

              if (element.data()['isUploader']) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminDashboardNew()));
              } else if(element.data()["isAdmin"]){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }else if(element.data()["isCharsindur"]){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => CharsindurHomePage()));
              }else if(element.data()["isTeesta"]){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TeestaHomePage()));
              }else if(element.data()["isMohanonda"]){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MohanondaHomePage()));
              }
              else if(element.data()["isDhaleshwari"]){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DhaleshwariHomePage()));
              }else if(element.data()["isBhanga"]){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BhangaHomePage()));
              }
            }
            if (!found && i >= length) {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LogInPage()));
            }
          });
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        snackBarMsg("User not found");
        setState(() {
          _isLoading = false;
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          _isLoading = false;
        });
        snackBarMsg("Wrong password");
      } else {
        setState(() {
          _isLoading = false;
        });
        snackBarMsg("Something is wrong");
      }
    }
  }

  //SnackBar
  void snackBarMsg(loginErrorMessage) {
    final snackBar = SnackBar(
      content: Text(
        loginErrorMessage.toString(),
        style: TextStyle(color: Colors.red),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
