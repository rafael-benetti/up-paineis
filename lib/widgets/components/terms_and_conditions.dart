import 'package:flutter/material.dart';
import 'package:uppaineis/util/color_helpers.dart';
import 'package:uppaineis/widgets/plus_widgets/plus_utils/text_decoration_plus.dart';
import 'package:uppaineis/widgets/plus_widgets/rich_text_plus.dart';
import 'package:uppaineis/widgets/plus_widgets/text_plus.dart';

class TermsAndConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichTextPlus(
        texts: [
          TextPlus(
            'By signing up, you agree with our ',
            color: ColorHelper.getTextColor(),
            fontWeight: FontWeight.normal,
            fontSize: 10,
          ),
          TextPlus(
            'Terms & Conditions',
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 10,
            textDecorationPlus: TextDecorationPlus(
                textDecoration: TextDecoration.underline,
                color: Colors.blue,
                decorationThickness: 3.0),
          ),
        ],
      ),
    );
  }
}
