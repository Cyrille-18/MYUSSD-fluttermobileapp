import 'package:flutter/material.dart';
import 'package:myussd_flutterapp/services/Contact_service.dart';
import 'package:myussd_flutterapp/widgets/Contacts_list.dart';
import 'package:myussd_flutterapp/widgets/appbar.dart';
import 'package:myussd_flutterapp/widgets/search_bar.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class MoneytransferScreen extends StatefulWidget {
  const MoneytransferScreen({super.key});

  @override
  State<MoneytransferScreen> createState() => _MoneytransferScreenState();
}

class _MoneytransferScreenState extends State<MoneytransferScreen> {
  List<Contact> _contacts = [];
  List<Contact> _filteredContacts = [];
  final TextEditingController _searchController = TextEditingController();
  final ContactService _contactService =
      ContactService(); // Crée une instance du service

  @override
  void initState() {
    super.initState();
    _fetchContacts();
    _searchController.addListener(_filterContacts);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Récupérer les contacts via le service
  Future<void> _fetchContacts() async {
    final contacts = await _contactService.getContacts(); // Utilise l'instance
    setState(() {
      _contacts = contacts;
      _filteredContacts = _contacts;
    });
  }

  // Filtrer les contacts selon la recherche
  void _filterContacts() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredContacts = _contacts
          .where((contact) =>
              (contact.displayName ?? '').toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        title: "Transfert D'Argent",
        istitlecenter: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Ajoute un espace autour
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligne les widgets à gauche
          children: [
            Text(
              "À qui souhaitez-vous envoyer de l'argent ?",
              style: TextStyle(
                fontSize: 18, // Taille du texte
                fontWeight: FontWeight.bold, // Texte en gras
              ),
            ),
            const SizedBox(
              height: 16,
            ), // Espacement entre le texte et la barre de recherche
            Search_bar(controller: _searchController),
            const SizedBox(
              height: 16,
            ),
            Expanded(child: ContactsList(contacts: _filteredContacts))
          ],
        ),
      ),
    );
  }
}
