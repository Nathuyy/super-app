import 'package:flutter/material.dart';

import '../../../contact_list/presentation/pages/contact_list.dart';
import 'menu_item.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 14,
      mainAxisSpacing: 14,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        MenuItem(
          icon: Icons.phone_outlined,
          title: 'Contatos',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ContactList(),
              ),
            );
          },
        ),
      ],
    );
  }
}