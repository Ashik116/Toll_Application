import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
                                  resetPassword();
                                }
                              },
                              child: Text('SEND EMAIL'),
                            ),
                          ),
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
