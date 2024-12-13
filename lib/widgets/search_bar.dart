import 'package:flutter/material.dart';

class Search_bar extends StatelessWidget {
  final TextEditingController controller;
  const Search_bar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "Rechercher un contact...",
        prefixIcon: Icon(Icons.search), // Icône de recherche
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // Bordure arrondie
          borderSide: BorderSide(color: Colors.grey), // Couleur de la bordure
        ),
        filled: true, // Arrière-plan rempli
        fillColor: Colors.grey[200], // Couleur d'arrière-plan
      ),
    );
  }
}
