import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../widgets/base_widgets/footer.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  Future<void> _refreshData() async {
    // Adicione aqui a lógica para atualizar os dados
    // Por exemplo, você pode buscar novos dados da internet ou atualizar o estado local
    // Simulando um atraso para demonstração
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UP Painéis',
          style: TextStyle(color: Colors.white), // Título branco
        ),
        backgroundColor: Colors.red, // Cabeçalho vermelho
        automaticallyImplyLeading: false, // Remove a seta de voltar
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        // Função que será chamada ao arrastar para baixo
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: [
            // Primeiro Card com imagem e tag
            Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  // Miniatura da imagem
                  GestureDetector(
                    onTap: () => _showFullImage(context,
                        'https://firebasestorage.googleapis.com/v0/b/uppaineis-576c4.appspot.com/o/happy.png?alt=media&token=07e556d6-a9fe-423b-9a46-3cebf323623f'),
                    child: Container(
                      width: double.infinity,
                      height: 520.0, // Altura ajustada para a miniatura
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10.0)),
                        child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/uppaineis-576c4.appspot.com/o/happy.png?alt=media&token=07e556d6-a9fe-423b-9a46-3cebf323623f',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Tag com informações e ícone de compartilhamento
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(10.0)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Ícone de compartilhamento
                        IconButton(
                          icon: Icon(Icons.share, color: Colors.blue),
                          onPressed: () {
                            Share.share('Up Painéis:');
                          },
                        ),
                        SizedBox(width: 10.0), // Espaço entre o ícone e o texto
                        // Texto com localização, data e hora
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Localização: Porto Belo',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5.0),
                              // Espaço entre o texto e as datas
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Data: 15/07/2024',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey[700]),
                                  ),
                                  Text(
                                    'Hora: 14:00',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0), // Espaço entre os cards
            // Segundo Card com imagem e tag
            Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  // Miniatura da imagem
                  GestureDetector(
                    onTap: () => _showFullImage(context,
                        'https://firebasestorage.googleapis.com/v0/b/uppaineis-576c4.appspot.com/o/happy2.png?alt=media&token=fc3308be-87bf-4e08-91d7-05e59433c1c5'),
                    child: Container(
                      width: double.infinity,
                      height: 520.0, // Altura ajustada para a miniatura
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10.0)),
                        child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/uppaineis-576c4.appspot.com/o/happy2.png?alt=media&token=fc3308be-87bf-4e08-91d7-05e59433c1c5',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Tag com informações e ícone de compartilhamento
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(10.0)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Ícone de compartilhamento
                        IconButton(
                          icon: Icon(Icons.share, color: Colors.blue),
                          onPressed: () {
                            Share.share('Up Painéis:');
                          },
                        ),
                        SizedBox(width: 10.0), // Espaço entre o ícone e o texto
                        // Texto com localização, data e hora
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Localização: Camboriú',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5.0),
                              // Espaço entre o texto e as datas
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Data: 20/07/2024',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey[700]),
                                  ),
                                  Text(
                                    'Hora: 16:00',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(), // Adiciona o rodapé
    );
  }

  void _showFullImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: InteractiveViewer(
            child: Image.network(
              imageUrl,
              fit: BoxFit.contain,
              // Remove a largura e a altura para exibir a imagem em seu tamanho original
            ),
          ),
        );
      },
    );
  }
}
