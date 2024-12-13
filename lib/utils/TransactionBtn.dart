import 'package:flutter/material.dart';

class TransactionBtn extends StatelessWidget {
  final String label;
  final VoidCallback onPressed; // Propriété pour gérer l'action au clic

  const TransactionBtn({
    Key? key,
    required this.label,
    required this.onPressed, // Rend la propriété obligatoire
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed:
          onPressed, // Utilisation de la fonction passée par l'utilisateur
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: const BorderSide(
          color: Colors.black,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        fixedSize: const Size(180, 60),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.black, fontSize: 14),
      ),
    );
  }
}
