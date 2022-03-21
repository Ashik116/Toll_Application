
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ItemClickAnimation extends StatefulWidget {
  final Widget child;
  final double scaleValue;
  final Widget route;
  final String password;
  ItemClickAnimation(
      {Key key,
      this.child,
      @required this.scaleValue,
      this.route,
      this.password});

  @override
  _ItemClickAnimationState createState() => _ItemClickAnimationState();
}

class _ItemClickAnimationState extends State<ItemClickAnimation> {
  TextEditingController passwordController = TextEditingController();

  final dbRef = FirebaseDatabase.instance.reference();
  var currentUser = FirebaseAuth.instance.currentUser.uid.toString();
  var userEmail = FirebaseAuth.instance.currentUser.email;

  double scaleValue = 1.0;

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scaleValue,
      key: _scaffoldKey,
      child: GestureDetector(
          onTap: () {
            setState(() {
              scaleValue = widget.scaleValue;
              Future.delayed(Duration(milliseconds: 100)).then((value) {
                setState(() {
                  scaleValue = 1.0;
                });

                if(widget.route != null){
                  getAdmin("Admin");
                }
                if(widget.route != null && FirebaseAuth.instance.currentUser.email=="sakif@rocketmail.com"){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => widget.route));
                } else if(widget.route != null && FirebaseAuth.instance.currentUser.email=="admin@gmail.com"){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => widget.route));
                } else if(widget.route != null && widget.password=="regnum@124"  ){
                  getUser("Mohanonda");
                }else if(widget.route != null && widget.password=="regnum@456" ){
                  getUser("Teesta");
                }else if(widget.route!=null && widget.password=="regnum@203"){
                  getUser("Manikganj");
                }else if(widget.route!=null && widget.password=="regnum@322"){
                  getUser("Chittagong");
                }

               /* if (widget.route != null)
                 /* Navigator.push(
                      context, MaterialPageRoute(builder: (_) => widget.route));*/
                {
                  /* Alert(
                    context: context,
                    type: AlertType.info,
                    title: "Please Enter Your Key",
                    content: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        labelText: 'Key',
                      ),
                    ),
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        color: Color.fromRGBO(0, 179, 134, 1.0),
                      ),
                      DialogButton(
                        child: Text(
                          "Ok",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          setState(() {
                            if (passwordController.text == widget.password) {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => widget.route));
                              passwordController.clear();
                            } else {
                              Navigator.pop(context);
                              Flushbar(
                                titleText: Text(
                                  "Sorry!",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: Colors.red,
                                      fontFamily: "ShadowsIntoLightTwo"),
                                ),
                                icon: Icon(
                                  Icons.emoji_people,
                                  color: Colors.greenAccent,
                                ),
                                messageText: Text(
                                  "You entered a wrong key!",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.yellowAccent,
                                      fontFamily: "ShadowsIntoLightTwo"),
                                ),
                                duration: Duration(seconds: 3),
                              )..show(context);
                            }
                          });
                        },
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(116, 116, 191, 1.0),
                          Color.fromRGBO(52, 138, 199, 1.0)
                        ]),
                      )
                    ],
                  ).show();*/
                }*/
              });
            });
          },
          child: widget.child),
    );
  }

  getUser (String st) {

    try{
    dbRef.child(st).child("Users").child(currentUser).once().then((DataSnapshot snapshot) {

      if(snapshot.value.toString()==userEmail){
        //return snapshot.value[currentUser].toString();
        setState(() {
          print("test: "+snapshot.value);
          Navigator.push(context, MaterialPageRoute(builder: (_) => widget.route));
        });
      }
    });}catch(e){
      //snackBarMsg("You are not permitted to visit this site!");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'You are not permitted to visit this site!',
            style: TextStyle(fontSize: 18.0,),
          ),
        ),
      );
    }
  }
  getAdmin (String st) {

    try{
      dbRef.child("Users").child(st).child(currentUser).once().then((DataSnapshot snapshot) {

        if(snapshot.value.toString()==userEmail){
          //return snapshot.value[currentUser].toString();
          setState(() {
            print("test: "+snapshot.value);
            Navigator.push(context, MaterialPageRoute(builder: (_) => widget.route));
          });
        }
      });}catch(e){

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'You are not permitted to visit this site!',
            style: TextStyle(fontSize: 18.0,),
          ),
        ),
      );
    }
  }
  /*    final snackBar = SnackBar(
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
  }*/
}
