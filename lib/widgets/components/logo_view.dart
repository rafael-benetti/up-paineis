import 'package:flutter/material.dart';

class LogoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/images/app_logo.png",
        height: 135,
        width: 135,
      ),
    );
  }
}
