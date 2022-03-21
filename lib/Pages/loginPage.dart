import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/Pages/homePage.dart';
import 'package:toll_plaza/Provider/firebaseDatabase.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  getData() async {
    FireDatabaseMethod databaseMethods = new FireDatabaseMethod();
    await FireDatabaseMethod().getUserInfo(userName).then((snapshot) {
      allowedData = snapshot.document.data["access"];
      print("$allowedData -----------------------------------------------");
    });
  }

  bool _passwordHide = true;
  var userName;
  var allowedData;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //user Email and password
  var password;

  //login error message
  // var loginErrorMessage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[200],
      body: _isLoading ? loadingAnimation() :  Container(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/regnum.png", height: 150),
                  SizedBox(height: 10,),
                  Form(
                    key: _formKey,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0, left: 30, right: 30),
                          child: Column(
                            children: [
                              SizedBox(height: 15,),
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
                                    //hintText: "regnumit@gmail.com",
                                    prefixIcon: Icon(Icons.email_rounded),
                                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)
                                    )),

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
                              // ListTile(
                              //   title: Text("User Name"),
                              //   subtitle: TextFormField(
                              //     onChanged: (value) {
                              //       setState(() {
                              //         userName = value;
                              //       });
                              //     },
                              //     key: Key('userName'),
                              //     decoration: InputDecoration(
                              //         hintText: "regnumit@gmail.com",
                              //     helperText: 'Email Address',
                              //     border: UnderlineInputBorder()),
                              //
                              //     validator: (value) {
                              //       if (value.isEmpty) {
                              //         return "Enter Email";
                              //       } else if (!RegExp(
                              //               r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                              //           .hasMatch(value)) {
                              //         return "Invalid Mail Address";
                              //       } else
                              //         return null;
                              //     },
                              //     keyboardType: TextInputType.emailAddress,
                              //   ),
                              //   leading: Icon(
                              //     Icons.email,
                              //     size: 30,
                              //   ),
                              // ),
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
                                    //hintText: "******",
                                    prefixIcon: Icon(Icons.email_rounded),
                                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    suffixIcon: IconButton(
                                      icon: _passwordHide
                                          ? Icon(Icons.visibility_rounded)
                                          : Icon(Icons.visibility_off_rounded),
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
                              // ListTile(
                              //   title: Text("Password"),
                              //   subtitle: TextFormField(
                              //     onChanged: (value) {
                              //       setState(() {
                              //         password = value;
                              //       });
                              //     },
                              //     key: Key("password"),
                              //     obscureText: _passwordHide,
                              //     decoration: InputDecoration(
                              //         hintText: "******",
                              //         suffixIcon: IconButton(
                              //           icon: _passwordHide
                              //               ? Icon(Icons.remove_red_eye)
                              //               : Icon(Icons.security),
                              //           onPressed: () {
                              //             setState(() {
                              //               _passwordHide = !_passwordHide;
                              //             });
                              //           },
                              //         )),
                              //     validator: (value) {
                              //       if (value.isEmpty) {
                              //         return "Enter Password";
                              //       }
                              //       return null;
                              //     },
                              //   ),
                              //   leading: Icon(
                              //     Icons.vpn_key,
                              //     size: 30,
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 25.0),
                                child: ElevatedButton(
                                  key: Key('submit'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.lightGreen,
                                    elevation: 5,
                                    minimumSize: Size(double.infinity, 50),
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 20
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )
                                  ),
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    // Validate returns true if the form is valid, or false
                                    // otherwise.
                                    if (_formKey.currentState.validate()) {
                                      logIn();
                                      setState(() {
                                        _isLoading = true;
                                      });
                                    }
                                  },
                                  child: Text('Login'),
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
      getData();
      /*if (userCredential.user.displayName == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AdminDashboard()));
      } else if (userCredential.user.displayName != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }*/
      if (userCredential.user == null) {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInPage()));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
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
    //print("ok");
    final snackBar = SnackBar(
      content: Text(
        loginErrorMessage.toString(),
        style: TextStyle(color: Colors.red),
      ),
      // action: SnackBarAction(
      //   label: 'Undo',
      //   onPressed: () {
      //     // Some code to undo the change.
      //   },
      // ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
