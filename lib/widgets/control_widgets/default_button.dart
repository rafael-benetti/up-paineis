import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uppaineis/util/constant.dart';
import 'package:uppaineis/widgets/components/icon_view.dart';
import 'package:uppaineis/widgets/components/normal_text.dart';

class DefaultButton extends StatefulWidget {
  Function() onPress;
  String? buttonTitle;
  double width;
  Color color;
  double height;
  double radius;
  String? iconName;
  double? fontSize;
  var fontFamily;
  DefaultButton(
      {required this.onPress,
      this.buttonTitle,
      this.iconName,
      this.radius = 20.0,
      this.height = 40,
      this.width = 200,
      this.fontSize = 15.0,
      this.color = kAppColor,
      this.fontFamily = GoogleFonts.poppins});

  @override
  _DefaultButtonState createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: widget.width,
      height: widget.height,
      child: MaterialButton(
        color: widget.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        onPressed: widget.onPress,
        child: widget.iconName != null
            ? IconView(
                iconName: widget.iconName!,
                iconColor: kWhiteColor,
              )
            : NormalText(
                fontFamily: widget.fontFamily,
                text: widget.buttonTitle!,
                textColor: Colors.white,
                fontWeight: FontWeight.w600,
                textSize: widget.fontSize,
              ),
      ),
    );
  }
}
