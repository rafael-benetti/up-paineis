import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uppaineis/util/color_helpers.dart';

// ignore: must_be_immutable
class NormalText extends StatefulWidget {
  String text;
  Color? textColor;
  double? textSize;
  FontWeight fontWeight;
  TextDecoration textDecoration;
  TextAlign textAlign;
  TextOverflow textOverflow;
  int? maxLine;
  var fontFamily;
  double? opacity;
  NormalText(
      {required this.text,
      this.textColor,
      this.textSize,
      this.maxLine,
      this.opacity = 1.0,
      this.textOverflow = TextOverflow.ellipsis,
      this.textDecoration = TextDecoration.none,
      this.fontWeight = FontWeight.w400,
      this.textAlign = TextAlign.start,
      this.fontFamily = GoogleFonts.poppins});

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<NormalText> {
  @override
  Widget build(BuildContext context) {
    if (widget.textColor == null) {
      widget.textColor = ColorHelper.getTextColor();
    }
    return Text(
      widget.text,
      maxLines: widget.maxLine,
      textScaleFactor: 0.95,
      overflow: widget.textOverflow,
      style: widget.fontFamily(
          decoration: widget.textDecoration,
          color: widget.textColor!.withOpacity(widget.opacity!),
          fontSize: widget.textSize,
          fontWeight: widget.fontWeight),
      textAlign: widget.textAlign,
    );
  }
}
