import 'package:flutter/material.dart';
import 'package:uppaineis/util/Utils.dart';
import 'package:uppaineis/widgets/base_widgets/base_safe_scaffold.dart';
import 'package:uppaineis/widgets/components/logo_view.dart';
import 'package:uppaineis/widgets/components/normal_text.dart';
import 'package:uppaineis/widgets/control_widgets/default_button.dart';

import 'login_page_3/login_page_3_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

String govoUrl =
    "https://codecanyon.net/item/flutter-govo-travel-app-in-flutter/29883635";
String dellyUrl =
    "https://codecanyon.net/item/flutter-dellyshop-ecommerce-app/28804937";

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150.0,
              ),
              LogoView(),
              SizedBox(
                height: 50.0,
              ),
              DefaultButton(
                radius: 5,
                width: Utils.size(context).width,
                onPress: () async {
                  await Navigator.pushNamed(
                      context, LoginPage3Screen.routeName);
                },
                buttonTitle: "Clique",
              ),
            ],
          ),
        ),
      ]),
    );
  }

  ListTile buildListTile(
      {required String title, required imageUrl, required Function() onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Image.asset(imageUrl),
      title: NormalText(
        text: title,
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      subtitle: NormalText(text: "XamDesign"),
    );
  }
}
