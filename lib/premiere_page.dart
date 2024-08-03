import 'package:beiza_chadrack/deuxieme_page.dart';
import 'package:flutter/material.dart';

class PremierePage extends StatefulWidget {
  const PremierePage({super.key});

  @override
  State<PremierePage> createState() => _PremierePageState();
}

class _PremierePageState extends State<PremierePage> {
  var alphabet = 'abcdefghijklmnopqrstuvwxyz';
  var champ1 = TextEditingController();
  var champ2 = TextEditingController();
  var message_affiche = "MESSAGE CLAIR";
  var nombre_decalage;

  String chiffrer(String mot) {
    final cryptogramme = [];
    for (final lettre in mot.toLowerCase().split('')) {
      final index = alphabet.indexOf(lettre);
      final lettrecrypte = (index + int.parse(nombre_decalage)) % 26;
      cryptogramme.add(alphabet[lettrecrypte]);
      message_affiche = cryptogramme.join('');
    }
    return message_affiche;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "CHIFFREMENT DE CESAR",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 68, 81, 255),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 190, 190, 190),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: ListView(
            children: [
              GestureDetector(
                child: const Text(
                  "CHIFFREMENT",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PremierePage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
              GestureDetector(
                child: const Text(
                  "DECHIFFREMENT",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DeuxiemePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              autocorrect: true,
              controller: champ1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "DECALAGE",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: champ2,
              decoration: const InputDecoration(
                hintText: "MESSAGE EN CLAIR",
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 145, 149, 156)),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            MaterialButton(
              height: 50,
              onPressed: () {
                setState(() {
                  nombre_decalage = champ1.text;
                  message_affiche = champ2.text;
                  chiffrer(message_affiche);
                });
              },
              color: const Color.fromARGB(255, 68, 81, 255),
              child: const Text(
                "CHIFFRER",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              message_affiche,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
