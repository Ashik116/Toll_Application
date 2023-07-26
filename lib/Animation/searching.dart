import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class searchAnimation extends StatelessWidget {
  const searchAnimation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    return Material(
      color: providerThemeAndColor.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10,),
          DefaultTextStyle(
            style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            child: AnimatedTextKit(
              animatedTexts:
              [
                TypewriterAnimatedText('Searching...', speed: Duration(milliseconds: 250))
              ],
              isRepeatingAnimation: true,
            ),
          )
        ],
      ),
    );
  }
}