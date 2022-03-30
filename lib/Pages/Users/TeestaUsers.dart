import 'package:auto_animated/auto_animated.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/Model/userModel.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class TeestaUsers extends StatefulWidget {
  // const ({Key? key}) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<TeestaUsers> {
  DatabaseReference ref;
  List<UserModel> users = <UserModel>[];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    checkData();
  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);

    return Scaffold(
      backgroundColor: providerThemeAndColor.backgroundColor,
      body: isLoading ? loadingAnimation() : 
      RefreshIndicator(
        backgroundColor: providerThemeAndColor.toggleInactiveColor,
        color: providerThemeAndColor.highlighterTextColor,
        onRefresh: _onRefresh,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              color: providerThemeAndColor.barColor,
              child: Center(
                child: Text("Teesta Users List",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: providerThemeAndColor.secondTextColor,
                      //fontStyle: FontStyle.italic,
                      fontSize: 20
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            users.isEmpty ? Center(child: Text('Data not found'),) :
            Expanded(
              child: Flexible(
                child: LiveList(
                  showItemInterval: Duration(milliseconds: 150),
                  showItemDuration: Duration(milliseconds: 350),
                  reAnimateOnVisibility: true,
                  scrollDirection: Axis.vertical,
                  //shrinkWrap: true,
                  itemCount: users.length,
                  itemBuilder: buildAnimatedItem,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAnimatedItem(BuildContext context, int index, Animation<double> animation) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      // And slide transition
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, -0.1),
          end: Offset.zero,
        ).animate(animation),
        // Paste you Widget
        child: Card(
          margin: EdgeInsets.all(10),
          elevation: 10,
          color: providerThemeAndColor.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text(
                users[index].email,
                style: TextStyle(
                  fontSize: 20,
                  color: providerThemeAndColor.secondTextColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  Future<void> _onRefresh() async {
    setState(() {
      isLoading = true;
      checkData();
    });
  }

  void checkData() {
    try {
      users.clear();
      final CollectionReference userCollection = FirebaseFirestore.instance.collection('UserRoles');
      userCollection.get().then((value) {
        if (value.size > 0) {
          value.docs.forEach((element) {
            if (element.data()['isTeesta']) {
              users.add(
                  UserModel(
                    id: element.id,
                    email: element.data()['email'],
                    isAdmin: element.data()['isAdmin'],
                    isMohanonda: element.data()['isMohanonda'],
                    isManikganj: element.data()['isManikganj'],
                    isChittagong: element.data()['isChittagong'],
                    isTeesta: element.data()['isTeesta'],
                  )
              );
            }
          });
        }
        setState(() {
          isLoading = false;
        });
      });
    } catch (e) {
      SnackBar snackBar = SnackBar(
        content:
        Text(
          'Data found error',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      isLoading = false;
    }
  }
}
