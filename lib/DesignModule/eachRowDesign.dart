import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';


class EachRowDesign extends StatefulWidget {
  final String firstColumnData;
  final String secondColumnData;
  final String thirdColumnData;
  final FontWeight fontWeight;
  final Color firstColumnFontColor;
  final Color secondColumnFontColor;
  final Color thirdColumnFontColor;
  final Color dividedColor;
  final Color backgroundColor;
  final double elevation;
  final Color dividerColor;

  EachRowDesign({
    Key key,
    @required this.firstColumnData,
    @required this.secondColumnData,
    this.thirdColumnData,
    this.fontWeight,
    this.firstColumnFontColor,
    this.backgroundColor,
    this.secondColumnFontColor,
    this.thirdColumnFontColor,
    this.dividedColor,
    this.elevation,
    this.dividerColor,
  });
  @override
  _EachRowDesignState createState() => _EachRowDesignState();
}

class _EachRowDesignState extends State<EachRowDesign> {
  String _firstColumnData ;
  String _secondColumnData;
  String _thirdColumnData;
  FontWeight _fontWeight;
  Color _firstColumnFontColor;
  Color _secondColumnFontColor;
  Color _thirdColumnFontColor;
  Color _dividerColor;
  Color _backgroundColor;
  double _elevation;

  void setUp() {
    _firstColumnData = widget.firstColumnData;
    _secondColumnData = widget.secondColumnData;
    _thirdColumnData = widget.thirdColumnData;
    _fontWeight = widget.fontWeight != null ? widget.fontWeight : FontWeight.normal;
    _firstColumnFontColor = widget.firstColumnFontColor != null ? widget.firstColumnFontColor : context.read<ThemeAndColorProvider>().secondTextColor;
    _secondColumnFontColor = widget.secondColumnFontColor != null ? widget.secondColumnFontColor : context.read<ThemeAndColorProvider>().secondTextColor;
    _thirdColumnFontColor = widget.thirdColumnFontColor != null ? widget.thirdColumnFontColor : context.read<ThemeAndColorProvider>().secondTextColor;
    _backgroundColor = widget.backgroundColor != null ? widget.backgroundColor : context.read<ThemeAndColorProvider>().backgroundColor;
    _elevation = widget.elevation != null ? widget.elevation : 10;
    _dividerColor = widget.dividerColor != null ? widget.dividerColor : Colors.green.shade900;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUp();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      color: _backgroundColor,
      elevation: _elevation,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 4,
              child: Text(
                _firstColumnData.toString(),
                style: TextStyle(
                    color: _firstColumnFontColor,
                    fontSize: 16,
                    fontWeight: _fontWeight
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 30,
                //width: 5,
                child: VerticalDivider(
                  color: _dividerColor,
                  thickness: 2,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                _secondColumnData.toString(),
                style: TextStyle(
                    color: _secondColumnFontColor,
                    fontSize: 16,
                    fontWeight: _fontWeight
                ),
                textAlign: TextAlign.center,
              ),
            ),
            _thirdColumnData == null ? Container() :
            Expanded(
              flex: 1,
              child: Container(
                height: 30,
                //width: 5,
                child: VerticalDivider(
                  color: _dividerColor,
                  thickness: 2,
                ),
              ),
            ),
            _thirdColumnData == null ? Container() : Expanded(
              flex: 4,
              child: Text(
                _thirdColumnData.toString(),
                style: TextStyle(
                    color: _thirdColumnFontColor,
                    fontSize: 16,
                    fontWeight: _fontWeight
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}