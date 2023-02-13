import 'package:excel/excel.dart';
import 'package:excel/excel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toll_plaza/Pages/Users/Users.dart';
import 'package:toll_plaza/Pages/loginPage.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';
import 'package:url_launcher/url_launcher.dart';


class NavigationDrawer extends StatelessWidget {




  final Function darkSwitch;
  final Function snack;
  final BuildContext context;
  const NavigationDrawer(this.darkSwitch, this.snack, this.context);





  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    bool isDark = providerThemeAndColor.darkTheme;
    return Drawer(
      elevation: 10,
      child: Container(
        color: providerThemeAndColor.drawerColor,
        child: ListView(
          children: [
            Image.asset("assets/images/regnum.png", height: 150),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 1,
              indent: 100,
              endIndent: 100,
            ),
            Divider(
              thickness: 1,
              indent: 60,
              endIndent: 60,
            ),
            Divider(
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.home_filled,
                size: 30,
                color: providerThemeAndColor.textColor,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: providerThemeAndColor.textColor,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.supervisor_account_rounded,
                size: 30,
                color: providerThemeAndColor.textColor,
              ),
              title: Text(
                'Users',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: providerThemeAndColor.textColor,
                ),
              ),
              onTap: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                Navigator.pop(context);
                if (sharedPreferences.getBool('isAdmin')) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Users()),
                  );
                } else {
                  snack("Permission Denied!");
                }
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout_rounded,
                size: 30,
                color: providerThemeAndColor.textColor,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: providerThemeAndColor.textColor,
                ),
              ),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.clear();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LogInPage()),
                    (route) => false);
              },
            ),
            Divider(
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: InkWell(
                onTap: () => darkSwitch(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.dark_mode,
                      size: 30,
                      color: providerThemeAndColor.textColor,
                    ),
                    SizedBox(
                      width: 23,
                    ),
                    Text(
                      "Dark",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: providerThemeAndColor.textColor,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Switch(
                      inactiveThumbColor: providerThemeAndColor.iconColor,
                      activeTrackColor: providerThemeAndColor.mainColor,
                      activeColor: providerThemeAndColor.textColor,
                      value: providerThemeAndColor.darkTheme,
                      onChanged: (value) {
                        darkSwitch();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.account_box_outlined,
                size: 30,
                color: providerThemeAndColor.textColor,
              ),
              title: Text(
                'About',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: providerThemeAndColor.textColor,
                ),
              ),
              onTap: () async {
                String website ='https://regnum.com.bd/';
                if(!await launch(website)){
                  throw "not launch $website";
                }
              },
            ),
            Divider(
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Divider(
              thickness: 1,
              indent: 60,
              endIndent: 60,
            ),
            Divider(
              thickness: 1,
              indent: 100,
              endIndent: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Version: 2.3.2',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: providerThemeAndColor.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
