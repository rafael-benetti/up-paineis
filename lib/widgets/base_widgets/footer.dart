import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Importe o pacote de autenticação do Firebase
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/admin/admin_page.dart';
import '../../screens/home_page.dart';
import '../../screens/login_page_3/login_page_3_screen.dart'; // Certifique-se de que este caminho está correto

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  PersistentBottomSheetController? _bottomSheetController;
  bool _isBottomSheetOpen = false;
  String _userName = '';
  String _userEmail = '';

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (userDoc.exists) {
        setState(() {
          _userName = userDoc['name'] ?? 'Usuário';
          _userEmail = user.email ?? 'Email não disponível';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Ícone 1 - Home
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              // Ícone 2 - Notificações
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.white),
                onPressed: () {
                  _toggleBottomSheet(context, 'Últimas Notificações');
                },
              ),
              // Ícone 3 - Conta
              IconButton(
                icon: Icon(Icons.account_circle, color: Colors.white),
                onPressed: () {
                  _toggleBottomSheet(context, 'Informações da Conta');
                },
              ),
            ],
          ),
          SizedBox(height: 1.0),
        ],
      ),
    );
  }

  void _toggleBottomSheet(BuildContext context, String info) {
    if (_isBottomSheetOpen) {
      _bottomSheetController?.close();
    } else {
      _bottomSheetController = Scaffold.of(context).showBottomSheet(
        (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(20.0),
            height: MediaQuery.of(context).size.height *
                0.5, // Ajuste o tamanho do BottomSheet
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (info == 'Últimas Notificações')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Notificação 1: Atualização importante do sistema.',
                          style: TextStyle(
                              fontSize: 16.0, color: Colors.grey[700])),
                      SizedBox(height: 10.0),
                      Text('Notificação 2: Seu perfil foi atualizado.',
                          style: TextStyle(
                              fontSize: 16.0, color: Colors.grey[700])),
                      SizedBox(height: 10.0),
                      Text('Notificação 3: Novas funcionalidades disponíveis.',
                          style: TextStyle(
                              fontSize: 16.0, color: Colors.grey[700])),
                    ],
                  )
                else if (info == 'Informações da Conta')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.account_circle, color: Colors.grey[700]),
                          SizedBox(width: 10.0),
                          Text(
                            'Nome: $_userName',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          Icon(Icons.email, color: Colors.grey[700]),
                          SizedBox(width: 10.0),
                          Text(
                            'Email: $_userEmail',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          Icon(Icons.build_circle_rounded,
                              color: Colors.grey[700]),
                          SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminPage()),
                              );
                            },
                            child: Text(
                              'Administrar',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () async {
                          await _logout(); // Chama a função de logout
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage3Screen()),
                            (Route<dynamic> route) =>
                                false, // Remove todas as rotas anteriores
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.exit_to_app, color: Colors.red),
                            SizedBox(width: 10.0),
                            Text(
                              'Sair',
                              style:
                                  TextStyle(fontSize: 16.0, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
      );
    }

    setState(() {
      _isBottomSheetOpen = !_isBottomSheetOpen;
    });
  }

  Future<void> _logout() async {
    await FirebaseAuth.instance
        .signOut(); // Encerra a sessão do usuário no Firebase

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId'); // Remove o ID do usuário do SharedPreferences

    // Adicione qualquer outra lógica de limpeza de estado aqui, se necessário
  }
}
