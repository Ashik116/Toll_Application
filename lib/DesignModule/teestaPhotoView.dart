import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class TeestaPhotoView extends StatefulWidget {
  @override
  _TeestaPhotoViewState createState() => _TeestaPhotoViewState();
}

class _TeestaPhotoViewState extends State<TeestaPhotoView> {
  var data;
  double _height, _width;
  double _pixelRatio;
  bool large;
  bool medium;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    data = ModalRoute.of(context).settings.arguments;

    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        Container(
          height: _height,
          width: _width,
          child: PhotoView(
            imageProvider:
                NetworkImage("http://103.95.99.166/image/" + data.toString()),
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
                }))
      ],
    )));
  }
}
