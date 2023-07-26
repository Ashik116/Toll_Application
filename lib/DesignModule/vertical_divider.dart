import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  final Color dividerColor;

  CustomVerticalDivider({Key key, this.dividerColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: VerticalDivider(
        color: dividerColor,
        thickness: 3,
        width: 5,
      ),
    );
  }
}
