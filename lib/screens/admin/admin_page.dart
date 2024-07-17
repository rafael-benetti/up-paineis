import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/base_widgets/footer.dart';

class AdminPage extends StatefulWidget {
  static const String routeName = '/admin';

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final _formKey = GlobalKey<FormState>();
  String _selectedClient = 'Cliente 1';
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // Faça algo com a imagem, se necessário
      print('Imagem capturada: ${image.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Administração',
          style: TextStyle(color: Colors.white), // Título branco
        ),
        backgroundColor: Colors.red, // Cabeçalho vermelho
        automaticallyImplyLeading: false, // Remove a seta de voltar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown para seleção de cliente
            DropdownButtonFormField<String>(
              value: _selectedClient,
              items: [
                'Cliente 1',
                'Cliente 2',
                'Cliente 3',
                'Cliente 4',
                'Cliente 5'
              ].map((String client) {
                return DropdownMenuItem<String>(
                  value: client,
                  child: Text(client),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedClient = newValue!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Selecione um cliente',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),

            // Ícone para acionar a câmera
            Center(
              child: IconButton(
                icon:
                    Icon(Icons.camera_alt, size: 50.0, color: Colors.grey[700]),
                onPressed: _pickImage,
              ),
            ),
            SizedBox(height: 20.0),

            // Campo para digitar a data
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Data',
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null && pickedDate != _selectedDate) {
                  setState(() {
                    _selectedDate = pickedDate;
                  });
                }
              },
              controller: TextEditingController(
                text: _selectedDate != null
                    ? '${_selectedDate!.toLocal()}'.split(' ')[0]
                    : '',
              ),
            ),
            SizedBox(height: 20.0),

            // Campo para digitar a hora
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Hora',
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null && pickedTime != _selectedTime) {
                  setState(() {
                    _selectedTime = pickedTime;
                  });
                }
              },
              controller: TextEditingController(
                text:
                    _selectedTime != null ? _selectedTime!.format(context) : '',
              ),
            ),
            SizedBox(height: 20.0),

            // Botão de Salvar
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Lógica para salvar os dados
                    print('Cliente: $_selectedClient');
                    print('Data: ${_selectedDate?.toLocal()}');
                    print('Hora: ${_selectedTime?.format(context)}');
                  }
                },
                child: Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(), // Adiciona o rodapé
    );
  }
}
