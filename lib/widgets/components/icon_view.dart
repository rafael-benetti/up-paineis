import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uppaineis/util/color_helpers.dart';

class IconView extends StatefulWidget {
  final String iconName;
  Color? iconColor;
  double? size;

  IconView({required this.iconName, this.iconColor, this.size = 25.0});

  @override
  _IconViewState createState() => _IconViewState();
}

class _IconViewState extends State<IconView> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      widget.iconName,
      color: widget.iconColor != null
          ? widget.iconColor
          : ColorHelper.getTextColor(),
      height: widget.size,
    );
  }
}
