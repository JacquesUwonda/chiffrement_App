import 'package:beiza_chadrack/premiere_page.dart';
import 'package:flutter/material.dart';

class DeuxiemePage extends StatefulWidget {
  const DeuxiemePage({super.key});

  @override
  State<DeuxiemePage> createState() => _DeuxiemePageState();
}

class _DeuxiemePageState extends State<DeuxiemePage> {
  String dechiffrement(String mot) {
    final messageclaire = [];
    for (final lettre in mot.toLowerCase().split('')) {
      final index = alphabet.indexOf(lettre);
      final lettrecrypte = (index - int.parse(nombre_decalage)) % 26;
      messageclaire.add(alphabet[lettrecrypte]);
      message_affiche = messageclaire.join('');
    }
    return message_affiche;
  }

  final alphabet = 'abcdefghijklmnopqrstuvwxyz';
  var message_affiche = "MESSAGE CHIFFRE";
  var nombre_decalage;
  final champ1 = TextEditingController();
  final champ2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 190, 190, 190),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              ListTile(
                title: const Text(
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
              ListTile(
                title: const Text(
                  "DECHIFFREMENT",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
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
      appBar: AppBar(
        title: const Text("DECHIFFREMENT DE CESAR",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 20)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 68, 81, 255),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                autocorrect: true,
                controller: champ1,
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
                autocorrect: true,
                controller: champ2,
                decoration: const InputDecoration(
                  hintText: "CRYPTOGRAMME",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                height: 50,
                onPressed: () {
                  setState(() {
                    nombre_decalage = champ1.text;
                    message_affiche = champ2.text;
                    dechiffrement(message_affiche);
                  });
                },
                color: const Color.fromARGB(255, 68, 81, 255),
                child: const Text(
                  "DECHIFFRER",
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
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
