import 'package:flutter/material.dart';
import 'package:uppaineis/util/Utils.dart';
import 'package:uppaineis/util/constant.dart';

class CustomCard extends StatefulWidget {
  final Widget? childWidget;
  final double height;
  final double width;
  final Color color;
  final Color borderColor;
  final double radius;
  final double offsetY;
  final double offsetX;
  final EdgeInsets padding;
  CustomCard(
      {this.childWidget,
      this.height = 60.0,
      this.color = kDarkItemColor,
      this.radius = 15.0,
      this.offsetY = 20.0,
      this.offsetX = 0.0,
      this.borderColor = Colors.black12,
      this.width = double.infinity,
      this.padding = const EdgeInsets.only(
          left: 10.0, right: 10.0, top: 0.0, bottom: 0.0)});
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 300),
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          color: widget.color,
          boxShadow: [
            BoxShadow(
                blurRadius: 20.0,
                color: widget.borderColor.withOpacity(0.2),
                offset: Offset(widget.offsetX, widget.offsetY))
          ]),
      padding: widget.padding,
      child: widget.childWidget,
    );
  }
}
