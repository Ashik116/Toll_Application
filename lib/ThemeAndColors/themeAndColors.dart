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


  Color _secondColor = Colors.lightGreen.shade700;
  get secondColor => darkTheme ? Color(0xFF181818) : _secondColor;

  Color _thirdColor = Colors.white54;
  get thirdColor => darkTheme ? Color(0xFF181818) : _thirdColor;

  Color _textColor = Colors.black54;
  get textColor => darkTheme ? Colors.white54 : _textColor ;

  Color _secondTextColor = Colors.black87;
  Color get secondTextColor => darkTheme ? Colors.white54 : _secondTextColor;

  Color _barColor = Colors.lightGreen.shade300;
  Color get barColor => darkTheme ? Colors.grey.shade900 : _barColor;

  Color _popupColor = Colors.lightGreen.shade300.withOpacity(0.9);
  Color get popupColor => darkTheme ? Colors.black87.withOpacity(0.9) : _popupColor;

  //Color _thirdTextColor = Colors.green[800];
  Color _thirdTextColor = Colors.black87;
  get thirdTextColor => darkTheme ? Colors.white : _thirdTextColor;

  Color _iconColor = Colors.black54;
  get iconColor => darkTheme ? Colors.white54 : _iconColor ;


  Color _backgroundColor = Colors.grey[200];
  get backgroundColor => darkTheme ? Color(0xFF121212): _backgroundColor ;

  Color _toggleActiveColor = Colors.green.shade400;
  get toggleActiveColor => darkTheme ? Colors.white10 : _toggleActiveColor;

  Color _toggleInactiveColor = Colors.grey.shade400;
  get toggleInactiveColor => darkTheme ? Color(0xFF282828) : _toggleInactiveColor;

  Color _indicatorColor = Colors.black26;
  get indicatorColor => darkTheme ? Colors.white30 : _indicatorColor;

  List<Color> _appBarColor = [Colors.lightBlue.shade200, Colors.lightGreen.shade200];
  get appBarColor => darkTheme ? [Colors.grey.shade900, Colors.grey.shade900] : _appBarColor;

  Color _sevenDaysCardColor = Colors.black12;
  get sevenDaysCardColor => darkTheme ? Colors.grey.shade900: _sevenDaysCardColor;

  Color _barHighlighterColor = Colors.lightGreen.shade200;
  get barHighlighterColor => darkTheme ? Color.fromRGBO(15, 48, 29, 1) : _barHighlighterColor;

  Color _highlighterTextColor = Colors.green.shade900;
  get highlighterTextColor => darkTheme ? Colors.green.shade900 : _highlighterTextColor;

  Color _drawerColor = Colors.green.shade100.withOpacity(0.9);
  get drawerColor => darkTheme ? Colors.black.withOpacity(0.9) : _drawerColor;
}