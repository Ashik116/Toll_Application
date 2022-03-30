import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';
import 'Users/passwordReset.dart';

class newUsers extends StatefulWidget {
  // const newUsers({Key? key}) : super(key: key);
  @override
  _newUsersState createState() => _newUsersState();
}

class _newUsersState extends State<newUsers> {
  bool _passwordHide = true;
  var newUserName;
  var newPassword;
  bool isAdmin = false;
  bool isTeesta = false;
  bool isChittagong = false;
  bool isMohanonda = false;
  bool isManikganj = false;
  String dropdownError = '';
  var site; //test
  String dropdownValue;
  var allowedData;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[200],
      body: _isLoading ? loadingAnimation() : Container(
        color: providerThemeAndColor.backgroundColor,
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
                      color: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35)
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0, left: 30, right: 30),
                          child: Column(
                            children: [
                              SizedBox(height: 15,),
                              TextFormField(
                                key: Key('newuserName'),
                                onChanged: (value) {
                                  setState(() {
                                    newUserName = value;
                                  });
                                },
                                decoration: InputDecoration(
                                    labelText: 'User Name',
                                    hintText: 'example@gmail.com',
                                    prefixIcon: Icon(Icons.email_rounded),
                                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30)
                                    )
                                ),
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
                                    newPassword = value;
                                  });
                                },
                                key: Key("newpassword"),
                                obscureText: _passwordHide,
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    prefixIcon: Icon(Icons.vpn_key_rounded),
                                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    suffixIcon: IconButton(
                                      icon: _passwordHide ? Icon(Icons.visibility_rounded) : Icon(Icons.visibility_off_rounded),
                                      onPressed: () {
                                        setState(() {
                                          _passwordHide = !_passwordHide;
                                        });
                                      },
                                    )
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Enter Password";
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                  child: DropdownButton(
                                    hint: Text('---Select site---', style: TextStyle(color: Colors.grey),),
                                    underline: Container(
                                      color: Colors.lightGreen,
                                      height: 2,
                                    ),
                                    //isExpanded: true,
                                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                                    iconSize: 20.0,
                                    elevation: 15,
                                    value: dropdownValue,
                                    style: TextStyle(color: Colors.black),
                                    items: ['Mohanonda', 'Teesta','Chittagong','Manikganj','Admin'].map((val) {
                                      return DropdownMenuItem<String>(
                                        value: val,
                                        child: Center(child: Text(val),),
                                      );},).toList(),
                                    onChanged: (val) {
                                      setState(() {
                                        dropdownValue = val;
                                      },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Text(
                                dropdownError,
                                style: TextStyle(color: Colors.red),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: ElevatedButton(
                                  key: Key('Create User'),
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
                                        borderRadius: BorderRadius.circular(50),
                                      )
                                  ),
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    // Validate returns true if the form is valid, or false
                                    // otherwise.
                                    if (_formKey.currentState.validate()) {
                                      if (dropdownValue != null) {
                                        if (dropdownValue == 'Admin') {
                                          isAdmin = true;
                                        }
                                        if (dropdownValue == 'Teesta') {
                                          isTeesta = true;
                                        }
                                        if (dropdownValue == 'Manikganj') {
                                          isManikganj = true;
                                        }
                                        if (dropdownValue == 'Mohanonda') {
                                          isMohanonda = true;
                                        }
                                        if (dropdownValue == 'Chittagong') {
                                          isChittagong = true;
                                        }
                                        createNewUser();
                                        //addnewUser();
                                      } else {
                                        setState(() {
                                          dropdownError = 'Please select site';
                                        });
                                      }
                                    }
                                  },
                                  child: Text('Add New User'),
                                ),
                              ),
                              TextButton(onPressed: () => {
                                Navigator.push(context,MaterialPageRoute(builder: (context) => passwordReset(),))
                              }, child: Text(
                                "Reset Password?",
                                style: TextStyle(fontSize: 14.0),
                              )
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
  Future createNewUser() async {
    FirebaseApp tempApp = await Firebase.initializeApp(name: 'temporaryRegister', options: Firebase.app().options);
    try {

      UserCredential firebaseAuth = await FirebaseAuth.instanceFor(app: tempApp).createUserWithEmailAndPassword(
          email: newUserName.toString(), password: newPassword.toString());

      //final firebaseAuth = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: newUserName.toString(), password: newPassword.toString());
      var user = firebaseAuth.user;
      final CollectionReference userCollection = FirebaseFirestore.instance.collection('UserRoles');
      await userCollection.doc(user.uid).set({
        'email': newUserName.toString(),
        'isAdmin': isAdmin,
        'isTeesta': isTeesta,
        'isMohanonda': isMohanonda,
        'isManikganj': isManikganj,
        'isChittagong': isChittagong,
        'isUploader': false,
      });

    } on FirebaseAuthException catch (e) {
      await tempApp.delete();
      if (e.code == 'weak-password') {
        snackBarMsg('The password provided is too weak.', Colors.red);
      } else if (e.code == 'email-already-in-use') {
        snackBarMsg('The account already exists for that email.', Colors.red);
      }
    } catch (e) {
      print(e);
    }
    snackBarMsg('A new user created successfully!', Colors.green);
    await tempApp.delete().then((value) {
      Navigator.pop(context);
    });
    return Future.sync(() => null);
  }


  addnewUser() async {
    //FirebaseAuth.instance.signOut();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: newUserName.toString(), password: newPassword.toString(),);
     // newuserName = userCredential.credential.toString();
      snackBarMsg('A new user created successfully!!!', Colors.green);
      //newuserName.clear();
      // newpassword.clear();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        snackBarMsg('The password provided is too weak.', Colors.red);
      } else if (e.code == 'email-already-in-use') {
        snackBarMsg('The account already exists for that email.', Colors.red);
      }
    } catch (e) {
      //print(e);
    }

    /* UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: newuserName.toString(), password: newpassword.toString());*/
    //get current user and UID
    var currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
     // print(currentUser.uid);
    }

    final databaseReference = FirebaseDatabase.instance.reference();
    /*databaseReference
        .child(dropdownValue.toString())
        .child('Users')
        .push()
        .set(newuserName.toString());*/
    if(dropdownValue.toString() == "Admin"){
      databaseReference
          .child('Users')
          .child('Admin')
          .child(currentUser.uid.toString())
          .set(currentUser.email.toString());
    }else{
      databaseReference
          .child(dropdownValue.toString())
          .child('Users')
          .child(currentUser.uid.toString())
          .set(currentUser.email.toString());
    }
    FirebaseAuth.instance.signOut();
    // .update({currentUser.uid: newuserName});
  }


  //SnackBar
  void snackBarMsg(loginErrorMessage, color) {
    final snackBar = SnackBar(
      content: Text(
        loginErrorMessage.toString(),
        style: TextStyle(color: color),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
