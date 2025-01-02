import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter/material.dart';
import 'package:myussd_flutterapp/screens/Amount_screen.dart';

class ContactsList extends StatelessWidget {
  final List<Contact> contacts;

  const ContactsList({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    if (contacts.isEmpty) {
      return const Center(
        child: Text("Aucun contact trouvé"),
      );
    }
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index]; // Correction du nommage de la variable
        return ListTile(
          leading: CircleAvatar(
            child: Text(contact.displayName?.substring(0, 1) ?? ''),
          ),
          title: Text(contact.displayName ?? 'Inconnu'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AmountScreen(
                        contactName: contact.displayName,
                        contactNumber: contact.phones.isNotEmpty
                            ? contact.phones.first.number
                            : 'pas de numéros')));
          },
        );
      },
    );
  }
}
