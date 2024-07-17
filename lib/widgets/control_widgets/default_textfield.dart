import 'package:flutter/material.dart';
import 'package:uppaineis/util/color_helpers.dart';
import 'package:uppaineis/widgets/plus_widgets/text_field_plus.dart';
import 'package:uppaineis/widgets/plus_widgets/text_plus.dart';

class DefaultTextField extends StatefulWidget {
  final String placeholder;
  final bool isPassword;
  final double opacity;
  final TextEditingController controller;

  DefaultTextField({
    required this.placeholder,
    this.isPassword = false,
    this.opacity = 1.0,
    required this.controller,
  });

  @override
  _DefaultTextFieldState createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldPlus(
      fontSize: 15.0,
      obscureText: widget.isPassword,
      textInputType: TextInputType.visiblePassword,
      textColor: ColorHelper.getTextColor(),
      placeholder: TextPlus(
        widget.placeholder,
        color: ColorHelper.getTextColor().withOpacity(widget.opacity),
      ),
      controller: widget.controller, // Adicione o controlador aqui
    );
  }
}
