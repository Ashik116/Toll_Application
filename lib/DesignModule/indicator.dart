import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final String value;
  final bool isSquare;
  final double size;

  const Indicator({
    Key key,
    @required this.color,
    @required this.text,
    @required this.value,
    this.isSquare = false,
    this.size = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.watch<ThemeAndColorProvider>().backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
                color: color,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: context.watch<ThemeAndColorProvider>().secondTextColor
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: context.watch<ThemeAndColorProvider>().secondTextColor,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
