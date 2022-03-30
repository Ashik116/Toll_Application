import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class TeestaPhotoView extends StatefulWidget {
  @override
  _TeestaPhotoViewState createState() => _TeestaPhotoViewState();
}

class _TeestaPhotoViewState extends State<TeestaPhotoView> {
  var data;
  bool large;
  bool medium;

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;

    return SafeArea(
        child: Scaffold(
            body: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: PhotoView(
                    imageProvider: NetworkImage("http://103.95.99.166/image/${data.toString()}"),
                  ),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                )
              ],
            )
        )
    );
  }
}
