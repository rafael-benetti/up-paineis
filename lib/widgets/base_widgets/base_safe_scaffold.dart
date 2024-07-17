import 'package:flutter/material.dart';
import 'package:uppaineis/util/Utils.dart';
import 'package:uppaineis/util/constant.dart';

class SafeScaffold extends StatefulWidget {
  final Widget child;
  Color? bgColor;
  SafeScaffold({required this.child, this.bgColor});

  @override
  _SafeScaffoldState createState() => _SafeScaffoldState();
}

class _SafeScaffoldState extends State<SafeScaffold> {
  @override
  Widget build(BuildContext context) {
    if (widget.bgColor == null) {
      widget.bgColor = Utils.isDarkMode
          ? kDarkBLackBgColor
          : Utils.getColorFromHex("#ffffff");
    }
    return Scaffold(
      backgroundColor: widget.bgColor,
      body: SafeArea(child: widget.child),
    );
  }
}
