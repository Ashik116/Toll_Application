import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeAndColorProvider extends ChangeNotifier{

  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  Future<void> setDarkTheme(bool darkTheme) async {
    _darkTheme = darkTheme;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("darkTheme", darkTheme);
    notifyListeners();
  }

  Color _mainColor = Colors.lightGreen;
  get mainColor => darkTheme ? Color(0xFF282828) : _mainColor;


  Color _secondColor = Colors.green[300];
  get secondColor => darkTheme ? Color(0xFF181818) : _secondColor;

  Color _thirdColor = Colors.white54;
  get thirdColor => darkTheme ? Color(0xFF181818) : _thirdColor;

  Color _textColor = Colors.black54;
  get textColor => darkTheme ? Colors.white54 : _textColor ;

  Color _secondTextColor = Colors.black87;
  Color get secondTextColor => darkTheme ? Colors.white54 : _secondTextColor;

  Color _thirdTextColor = Colors.green[800];
  get thirdTextColor => _thirdTextColor;

  Color _iconColor = Colors.black54;
  get iconColor => darkTheme ? Colors.white54 : _iconColor ;


  Color _backgroundColor = Colors.grey[200];
  get backgroundColor => darkTheme ? Color(0xFF121212): _backgroundColor ;



}