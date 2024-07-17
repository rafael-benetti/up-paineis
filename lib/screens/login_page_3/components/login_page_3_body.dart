import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uppaineis/util/Utils.dart';
import 'package:uppaineis/util/color_helpers.dart';
import 'package:uppaineis/util/constant.dart';
import 'package:uppaineis/widgets/components/cutom_card.dart';
import 'package:uppaineis/widgets/components/icon_view.dart';
import 'package:uppaineis/widgets/components/logo_view.dart';
import 'package:uppaineis/widgets/components/normal_text.dart';
import 'package:uppaineis/widgets/control_widgets/default_textfield.dart';
import 'package:uppaineis/widgets/plus_widgets/container_plus.dart';
import 'package:uppaineis/widgets/plus_widgets/plus_utils/gradient_plus.dart';
import 'package:uppaineis/widgets/plus_widgets/plus_utils/radius_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home_page.dart';

class LoginPage3Body extends StatefulWidget {
  @override
  _LoginPage3BodyState createState() => _LoginPage3BodyState();
}

class _LoginPage3BodyState extends State<LoginPage3Body>
    with TickerProviderStateMixin {
  TabController? _tabController;
  final List<Tab> myTabs = <Tab>[
    Tab(text: "Login"),
    Tab(text: "Registro"),
  ];
  int tabIndex = 0;
  bool isShowPass = false;
  bool isForgotPassword = false;

  // Controladores de texto
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _clientIdController = TextEditingController();

  @override
  void dispose() {
    _tabController?.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _clientIdController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: myTabs.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          borderColor: kAppColor,
          padding: const EdgeInsets.all(0.0),
          radius: 0.0,
          height: Utils.size(context).height * .3,
          color: Utils.isDarkMode ? kDarkBgColor : kWhiteColor,
          childWidget: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 10.0),
              LogoView(),
              TabBar(
                indicatorColor: kAppColor,
                controller: _tabController,
                labelColor: ColorHelper.getTextColor(),
                unselectedLabelColor: ColorHelper.getTextColor(),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 5.0,
                tabs: myTabs,
                onTap: (index) {
                  setState(() {
                    tabIndex = index;
                  });
                },
              ),
            ],
          ),
        ),
        Flexible(
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: NormalText(
                        text: "Veja Onde Sua Propaganda\nEstá Fazendo Sucesso",
                        textAlign: TextAlign.center,
                        textSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Center(
                      child: NormalText(
                        text: "Feedback em Tempo Real.",
                        textAlign: TextAlign.center,
                        textSize: 12.0,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    // Espaçamento entre o título e os campos
                    if (!isForgotPassword) ...[
                      // Campos de Registro
                      if (tabIndex == 1) ...[
                        CustomCard(
                          radius: 10.0,
                          color:
                              Utils.isDarkMode ? kDarkItemColor : kWhiteColor,
                          offsetY: 5.0,
                          childWidget: DefaultTextField(
                            placeholder: "Seu Nome",
                            opacity: 0.6,
                            controller: _nameController,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        CustomCard(
                          radius: 10.0,
                          color:
                              Utils.isDarkMode ? kDarkItemColor : kWhiteColor,
                          offsetY: 5.0,
                          childWidget: DefaultTextField(
                            placeholder: "ID do Cliente",
                            opacity: 0.6,
                            controller: _clientIdController,
                          ),
                        ),
                        SizedBox(height: 20.0), // Espaçamento entre os campos
                      ],
                      CustomCard(
                        radius: 10.0,
                        color: Utils.isDarkMode ? kDarkItemColor : kWhiteColor,
                        offsetY: 5.0,
                        childWidget: DefaultTextField(
                          placeholder: "Seu E-mail",
                          opacity: 0.6,
                          controller: _emailController,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      CustomCard(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        radius: 10.0,
                        color: Utils.isDarkMode ? kDarkItemColor : kWhiteColor,
                        offsetY: 5.0,
                        childWidget: Row(
                          children: [
                            Expanded(
                              child: DefaultTextField(
                                placeholder: "Senha",
                                opacity: 0.6,
                                isPassword: isShowPass,
                                controller: _passwordController,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isShowPass = !isShowPass;
                                });
                              },
                              child: IconView(
                                iconName: isShowPass
                                    ? "assets/svg/eye.svg"
                                    : "assets/svg/eye-slash.svg",
                                iconColor: kGrayColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      ContainerPlus(
                        onTap: () {
                          if (tabIndex == 0) {
                            _loginUser();
                          } else {
                            _registerUser();
                          }
                        },
                        gradient: GradientPlus.linear(colors: [
                          Utils.getColorFromHex("#e3373a"),
                          Utils.getColorFromHex("#e3373a"),
                        ]),
                        height: 50,
                        radius: RadiusPlus.all(5.0),
                        width: Utils.size(context).width,
                        color: kAppColor,
                        child: Center(
                          child: NormalText(
                            textColor: kWhiteColor,
                            textSize: 15.0,
                            text: tabIndex == 0 ? "FAZER LOGIN" : "REGISTRAR",
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      if (tabIndex == 0) ...[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isForgotPassword = true;
                            });
                          },
                          child: NormalText(
                            text: "Esqueceu a senha?",
                            textColor: kAppColor,
                            textSize: 15.0,
                          ),
                        ),
                      ],
                      SizedBox(height: 10.0),
                      Divider(color: kGrayColor),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => _launchURL(
                                'https://www.facebook.com/uppaineis'),
                            child: IconView(
                              iconName: "assets/svg/facebook.svg",
                              iconColor: kFacebookColor,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () => _launchURL(
                                'https://www.instagram.com/uppaineis/'),
                            child: IconView(
                              iconName: "assets/svg/instagram.svg",
                              iconColor: Utils.getColorFromHex("983A8B"),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () => _launchURL(
                                'https://www.youtube.com/@uppaineis'),
                            child: IconView(
                              iconName: "assets/svg/youtube.svg",
                              iconColor: Utils.getColorFromHex("F50B55"),
                            ),
                          ),
                        ],
                      )
                    ] else ...[
                      // Tela de Recuperação de Senha
                      CustomCard(
                        radius: 10.0,
                        color: Utils.isDarkMode ? kDarkItemColor : kWhiteColor,
                        offsetY: 5.0,
                        childWidget: DefaultTextField(
                          placeholder: "Seu E-mail",
                          opacity: 0.6,
                          controller: _emailController,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      ContainerPlus(
                        onTap: () {
                          _resetPassword();
                        },
                        gradient: GradientPlus.linear(colors: [
                          Utils.getColorFromHex("#e3373a"),
                          Utils.getColorFromHex("#e3373a"),
                        ]),
                        height: 50,
                        radius: RadiusPlus.all(5.0),
                        width: Utils.size(context).width,
                        color: kAppColor,
                        child: Center(
                          child: NormalText(
                            textColor: kWhiteColor,
                            textSize: 15.0,
                            text: "ENVIAR",
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isForgotPassword = false;
                          });
                        },
                        child: NormalText(
                          text: "Voltar para Login",
                          textColor: kAppColor,
                          textSize: 15.0,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

// Função para abrir o link da rede social
  void _launchURL(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url, forceSafariVC: false, forceWebView: false);
      } else {
        Fluttertoast.showToast(
          msg: "Não foi possível abrir o URL: $url",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Erro ao tentar abrir o URL: $url\nDetalhes: $e",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  void _loginUser() async {
    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('userId', userCredential.user!.uid);

      Navigator.pushNamedAndRemoveUntil(
          context, HomePage.routeName, (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        Fluttertoast.showToast(
          msg: "E-mail ou senha incorretos.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Erro ao fazer login. Tente novamente.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Erro inesperado. Tente novamente.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  void _registerUser() async {
    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      final name = _nameController.text.trim();
      final clientId = _clientIdController.text;

      if (email.isEmpty || password.isEmpty || name.isEmpty) {
        Fluttertoast.showToast(
          msg: "Por favor, preencha todos os campos.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }

      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'name': name,
        'email': email,
        'clientId': clientId,
      });

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('userId', userCredential.user!.uid);

      Fluttertoast.showToast(
        msg: "Cadastro realizado com sucesso!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      _emailController.clear();
      _passwordController.clear();
      _nameController.clear();

      SchedulerBinding.instance.addPostFrameCallback((_) {
        setState(() {
          tabIndex = 0;
        });
        _tabController?.animateTo(tabIndex);
      });

      Navigator.pushNamedAndRemoveUntil(
          context, HomePage.routeName, (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
          msg: "Este e-mail já está cadastrado.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Erro ao realizar cadastro. Tente novamente.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Erro inesperado. Tente novamente.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  void _resetPassword() async {
    try {
      final email = _emailController.text.trim();
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      Fluttertoast.showToast(
        msg: "E-mail de recuperação enviado!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      _emailController.clear();
      setState(() {
        isForgotPassword = false;
      });
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: "Erro ao enviar e-mail de recuperação. Tente novamente.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Erro inesperado. Tente novamente.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
