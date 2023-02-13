import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class AccouncePage extends StatefulWidget {
  const AccouncePage({Key key}) : super(key: key);

  @override
  State<AccouncePage> createState() => _AccouncePageState();
}

class _AccouncePageState extends State<AccouncePage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5)).then((value) => {
          setState(() {
            isLoading = false;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);

    return isLoading
        ? Container(
            color: providerThemeAndColor.backgroundColor,
            child: Center(
              child: loadingAnimation(),
            ),
          )
        : DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: providerThemeAndColor.backgroundColor,
              appBar: AppBar(
                actions: [],
                iconTheme:
                    IconThemeData(color: providerThemeAndColor.iconColor),
                backgroundColor: providerThemeAndColor.mainColor,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: providerThemeAndColor.appBarColor,
                    ),
                  ),
                ),
                title: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Regnum Toll Account Update",
                            style: TextStyle(
                                color: providerThemeAndColor.textColor),
                          ),
                        ),
                      ],
                    )),
                bottom: TabBar(
                  indicator: RectangularIndicator(
                    bottomLeftRadius: 100,
                    bottomRightRadius: 100,
                    topLeftRadius: 100,
                    topRightRadius: 100,
                    color: providerThemeAndColor.indicatorColor,
                    horizontalPadding: 5,
                    verticalPadding: 5,
                  ),
                  labelStyle: TextStyle(color: providerThemeAndColor.textColor),
                  indicatorColor: providerThemeAndColor.textColor,
                  labelColor: providerThemeAndColor.textColor,
                  tabs: [
                    Tab(
                      child: Text(
                        'TODAY',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'THIS WEEK',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'GRAPH',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
