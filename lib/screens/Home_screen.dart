import 'package:flutter/material.dart';
import 'package:myussd_flutterapp/models/transaction.dart';
import 'package:myussd_flutterapp/screens/Moneytransfer_screen.dart';
import 'package:myussd_flutterapp/utils/TransactionBtn.dart';
import 'package:myussd_flutterapp/widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = "Cyrille PIO"; // username

  final List<Transaction> transactions = [
    Transaction(
        date: DateTime.now(), details: 'Achat de services', montant: 50.0),
    Transaction(
        date: DateTime.now().subtract(const Duration(days: 1)),
        details: 'Révision de thèse',
        montant: 30.0),
    Transaction(
        date: DateTime.now().subtract(const Duration(days: 2)),
        details: 'Assistance en mathématiques',
        montant: 20.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "My USSD"),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 4, 26, 44),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Paramètres'),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 6, 42, 72),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bienvenue, $userName",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 3,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: const Color.fromARGB(255, 6, 42, 72),
                        ),
                        child: const Text(
                          "Consulter Votre Solde",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Transaction Rapide",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3,
                children: [
                  TransactionBtn(
                    label: "Transfert Argent",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MoneytransferScreen()),
                      );
                    },
                  ),
                  TransactionBtn(
                    label: "Paiement De Factures",
                    onPressed: () {
                      print("Paiement de factures");
                    },
                  ),
                  TransactionBtn(
                    label: "Achat De Crédits",
                    onPressed: () {
                      print("Achat de crédits");
                    },
                  ),
                  TransactionBtn(
                    label: "Achat De Forfaits",
                    onPressed: () {
                      print("Achat de forfaits");
                    },
                  ),
                  TransactionBtn(
                    label: "Payement marchand",
                    onPressed: () {
                      print("Paiement marchand");
                    },
                  ),
                  TransactionBtn(
                    label: "Mon Compte",
                    onPressed: () {
                      print("Mon Compte");
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "Vos Activités",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(height: 8),
              Container(
                height: 300,
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    return ListTile(
                      leading: const Icon(Icons.attach_money),
                      title: Text(transaction.details),
                      subtitle: Text(
                        'Date: ${transaction.date.day}/${transaction.date.month}/${transaction.date.year}',
                      ),
                      trailing: Text(
                        '${transaction.montant.toStringAsFixed(2)} CFA',
                        style: const TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
