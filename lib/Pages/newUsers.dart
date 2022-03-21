import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'Users/passwordReset.dart';

class newUsers extends StatefulWidget {
 // const newUsers({Key? key}) : super(key: key);
  @override
  _newUsersState createState() => _newUsersState();
}

class _newUsersState extends State<newUsers> {
  bool _passwordHide = true;
  var newuserName;
  var newpassword;
  var site; //test
  String dropdownValue = "Mohanonda";
  var allowedData;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/regnum.png", height: 150),
                Form(
                  key: _formKey,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text("Email"),
                            subtitle: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  newuserName = value;
                                });
                              },
                              key: Key('newuserName'),
                              decoration: InputDecoration(
                                  hintText: "regnumit@gmail.com"),
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
                            leading: Icon(
                              Icons.email,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: Text("Password"),
                            subtitle: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  newpassword = value;
                                });
                              },
                              key: Key("newpassword"),
                              obscureText: _passwordHide,
                              decoration: InputDecoration(
                                  hintText: "******",
                                  suffixIcon: IconButton(
                                    icon: _passwordHide
                                        ? Icon(Icons.remove_red_eye)
                                        : Icon(Icons.security),
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
                            leading: Icon(
                              Icons.vpn_key,
                              size: 30,
                            ),
                          ),
                          Container(
                            width: 120,
                              child:Center(child: DropdownButton(
                                hint: dropdownValue == null
                                    ? Text('Site Name')
                                    : Text(
                                  dropdownValue,
                                  style: TextStyle(color: Colors.black),
                                ),
                                isExpanded: true,
                                iconSize: 20.0,
                                elevation: 16,
                                style: TextStyle(color: Colors.black),
                                items: ['Mohanonda', 'Teesta','Chittagong','Manikganj','Admin'].map(
                                      (val) {
                                    return DropdownMenuItem<String>(
                                      value: val,
                                      child: Center(child: Text(val),),
                                    );
                                  },
                                ).toList(),
                                onChanged: (val) {
                                  setState(
                                        () {
                                      dropdownValue = val;
                                    },
                                  );
                                },
                              ),)
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: RaisedButton(
                              key: Key('submit'),
                              color: Colors.blue,
                              textColor: Colors.white,
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                // Validate returns true if the form is valid, or false
                                // otherwise.
                                if (_formKey.currentState.validate()) {
                                  addnewUser();
                                }
                              },
                              child: Text('Add New User'),
                            ),
                          ),
                          TextButton(onPressed: ()=>{
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>passwordReset(),))
                          }, child: Text("Reset Password?",style: TextStyle(fontSize: 14.0),))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  addnewUser() async {
    //FirebaseAuth.instance.signOut();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: newuserName.toString(), password: newpassword.toString(),);
     // newuserName = userCredential.credential.toString();
      snackBarMsg('A new user created successfully!!!');
      //newuserName.clear();
      // newpassword.clear();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        snackBarMsg('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        snackBarMsg('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    /* UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: newuserName.toString(), password: newpassword.toString());*/
    //get current user and UID
    var currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      print(currentUser.uid);
    }

    final databaseReference = FirebaseDatabase.instance.reference();
    /*databaseReference
        .child(dropdownValue.toString())
        .child('Users')
        .push()
        .set(newuserName.toString());*/
    if(dropdownValue.toString()=="Admin"){
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
  void snackBarMsg(loginErrorMessage) {
    //print("ok");
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
}
