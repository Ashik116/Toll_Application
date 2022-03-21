import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loadingAnimation extends StatelessWidget {
  const loadingAnimation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitSpinningLines(
            color: Colors.lightGreen[300],
            size: 130,
          ),
          SizedBox(height: 10,),
          Text('Loading...',
            style: TextStyle(
                color: Colors.lightGreen,
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}