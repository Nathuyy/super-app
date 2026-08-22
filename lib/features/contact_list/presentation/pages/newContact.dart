import 'package:flutter/material.dart';

class ContactFormPage extends StatefulWidget {
  const ContactFormPage({super.key});

  @override
  State<ContactFormPage> createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  static const Color primaryColor = Color(0xFF226678);
  static const Color secondaryColor = Color(0xFF888676);

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  // Lista de empresas disponíveis (depois pode vir de uma API/banco)
  final List<String> empresas = [
    'Construtivo',
    'CSN',
    'Motiva',
  ];

  // Guarda a empresa selecionada
  String? empresaSelecionada;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void salvarContato() {
    if (formKey.currentState!.validate()) {
      final novoContato = {
        'nome': nameController.text,
        'telefone': phoneController.text,
        'email': emailController.text,
        'empresa': empresaSelecionada,
      };

      Navigator.pop(context, novoContato);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F7F5),
        title: const Text(
          'Novo Contato',
          style: TextStyle(color: primaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o nome';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: 'Telefone'),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
            
                // Dropdown de empresas
                LayoutBuilder(
                  builder: (context, constraints) {
                    return DropdownMenu<String>(
                      initialSelection: empresaSelecionada,
                      label: const Text('Empresa'),
                      width: constraints.maxWidth,
                      menuHeight: 250,
                      textStyle: const TextStyle(fontSize: 14),
                      onSelected: (value) {
                        setState(() {
                          empresaSelecionada = value;
                        });
                      },
                      dropdownMenuEntries: empresas.map((empresa) {
                        return DropdownMenuEntry<String>(
                          value: empresa,
                          label: empresa,
                        );
                      }).toList(),
                    );
                  },
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: salvarContato,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'Salvar',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}