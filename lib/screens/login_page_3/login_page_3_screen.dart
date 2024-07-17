import 'package:flutter/material.dart';
import 'package:uppaineis/widgets/base_widgets/base_safe_scaffold.dart';

import 'components/login_page_3_body.dart';

class LoginPage3Screen extends StatelessWidget {
  static const routeName = "/login_page_3_screen";

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(child: LoginPage3Body());
  }
}
