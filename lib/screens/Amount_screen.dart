import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myussd_flutterapp/widgets/appbar.dart';

class AmountScreen extends StatefulWidget {
  final String contactName;
  final String contactNumber;

  const AmountScreen({
    super.key,
    required this.contactName,
    required this.contactNumber,
  });

  @override
  State<AmountScreen> createState() => _AmountScreenState();
}

class _AmountScreenState extends State<AmountScreen> {
  final TextEditingController _amountController = TextEditingController();
  String? _errorMessage;

  void _validateAmount() {
    final amount = double.tryParse(_amountController.text);
    if (amount == null || amount <= 0) {
      setState(() {
        _errorMessage = "Le montant doit être supérieur à 0.";
      });
    } else {
      setState(() {
        _errorMessage = null;
      });
      // Logique pour confirmer le montant
      print("Montant confirmé : $amount");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "Transfert D'argent"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Entrer le montant à envoyer à ${widget.contactName} au ${widget.contactNumber}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Montant',
                hintText: 'Saisissez le montant',
                errorText: _errorMessage,
              ),
              keyboardType: TextInputType.number, // Pavé numérique
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9]')), // Permet uniquement les chiffres
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _validateAmount,
              child: Text("Confirmer"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }
}
