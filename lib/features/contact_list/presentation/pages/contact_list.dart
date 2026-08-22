import 'package:flutter/material.dart';
import 'package:super_app/app/app.dart';
import 'package:super_app/features/contact_list/presentation/pages/newContact.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  static const Color primaryColor = Color(0xFF226678);
  static const Color secondaryColor = Color(0xFF888676);

  final TextEditingController _searchController = TextEditingController();
  List<dynamic> contacts = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> openCreateContact() async {
    final novoContato = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ContactFormPage()),
    );

    if (novoContato != null) {
      setState(() {
        contacts.add(novoContato);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F7F5),
        title: const Text('Contatos', style: TextStyle(color: primaryColor)),
      ),
      backgroundColor: const Color(0xFFF7F7F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: secondaryColor.withOpacity(0.7),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              decoration: InputDecoration(
                                hintText: 'Buscar cliente, pessoa...',
                                hintStyle: TextStyle(
                                  color: secondaryColor.withOpacity(0.7),
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                              ),
                              onChanged: (value) {
                                // implementar logica
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.25),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: openCreateContact,
                      icon: const Icon(
                        Icons.add,
                        size: 26,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(14),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // aqui embaixo você vai renderizar _contacts, ex:
              // ..._contacts.map((c) => ContactTile(contact: c)),
            ],
          ),
        ),
      ),
    );
  }
}
