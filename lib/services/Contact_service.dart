import 'package:flutter_contacts/flutter_contacts.dart';

class ContactService {
  // Récupérer les contacts via flutter_contacts
  Future<List<Contact>> getContacts() async {
    try {
      // Vérifie si l'application a la permission d'accéder aux contacts
      if (await FlutterContacts.requestPermission()) {
        // Récupère la liste des contacts
        final contacts = await FlutterContacts.getContacts();
        return contacts;
      } else {
        // Si la permission est refusée, gère l'erreur ou affiche un message
        throw Exception('Permission refusée pour accéder aux contacts.');
      }
    } catch (e) {
      throw Exception('Erreur lors de la récupération des contacts: $e');
    }
  }
}
