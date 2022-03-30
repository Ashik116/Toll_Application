import 'package:flutter/material.dart';


class CustomDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: Material(
                  color: Colors.white,
                  child: CircularProgressIndicator(),
                  shape: CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                ),
              ),
            ),
          ],
        )
    );
  }
}