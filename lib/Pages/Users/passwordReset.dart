import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class passwordReset extends StatefulWidget {
  //const passwordReset({Key? key}) : super(key: key);

  @override
  _passwordResetState createState() => _passwordResetState();
}

class _passwordResetState extends State<passwordReset> {
  var newuserName;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: providerThemeAndColor.backgroundColor,
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
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
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
                            Center(
                              child: Text(
                                'Reset Password',
                                style: TextStyle(
                                  color: Colors.green.shade800,
                                  fontSize: 23,
                                ),
                              ),
                            ),
                            SizedBox(height: 15,),
                            TextFormField(
                              key: Key('newuserName'),
                              onChanged: (value) {
                                setState(() {
                                  newuserName = value;
                                });
                              },
                              decoration: InputDecoration(
                                  labelText: 'Email',
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
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: ElevatedButton(
                                key: Key('submit'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.lightGreen,
                                  elevation: 10,
                                  minimumSize: Size(double.infinity, 50),
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 20
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  // Validate returns true if the form is valid, or false
                                  // otherwise.
                                  if (_formKey.currentState.validate()) {
                                    resetPassword();
                                  }
                                },
                                child: Text('Reset Password'),
                              ),
                            ),
                            SizedBox(height: 10,),
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
    );

  }

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: newuserName);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Password Reset Email has been sent !',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              'No user found for that email.',
              style: TextStyle(fontSize: 18.0,),
            ),
          ),
        );
      }
    }
  }
}
