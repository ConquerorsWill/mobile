// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const Contato());
}

class Contato extends StatelessWidget {
  const Contato({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Principal(title: 'Contato Pessoal'),
    );
  }
}

class Principal extends StatefulWidget {
  const Principal({super.key, required this.title});

  final String title;

  @override
  State<Principal> createState() => _PrincipalEstado();
}

class _PrincipalEstado extends State<Principal> {
  final foto = const CircleAvatar(
    backgroundImage: NetworkImage(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSLC5vlN7WOex87l468HxRMe09jxuKgANlFg&usqp=CAU'),
    radius: 150,
  );

  final nome = const Text(
    'Kaiky',
    style: TextStyle(fontSize: 30),
    textAlign: TextAlign.center,
  );
  final obs = const Text(
    'Programador Full Buxa Senac',
    style: TextStyle(fontSize: 20, color: Colors.blue),
  );
  final email = IconButton(
    icon: const Icon(Icons.mail),
    color: Colors.blue,
    onPressed: () {
      launchUrl(Uri(
        scheme: 'mailto',
        path: 'kaiky.4963@aluno.pr.senac.br',
        queryParameters: {
          'subject': 'Assuntodo email',
          'body': 'Corpo do Email',
        },
      ));
    },
  );

  final telefone = IconButton(
    icon: const Icon(Icons.phone),
    color: Colors.blue,
    onPressed: () {
      launchUrl(Uri(scheme: 'tel', path: '+5544974009708'));
    },
  );

  final sms = IconButton(
    color: Colors.blue,
    icon: const Icon(Icons.sms),
    onPressed: () {
      launchUrl(Uri(scheme: 'sms', path: '+5544974009708'));
    },
  );

  final site = IconButton(
    color: Colors.blue,
    icon: const Icon(Icons.open_in_browser),
    onPressed: () {
      launchUrl(
          Uri.parse('https://www.linkedin.com/in/kaiky-cetra-03a373281/'));
    },
  );

  final whatsapp = IconButton(
    color: Colors.blue,
    icon: const Icon(Icons.wechat),
    onPressed: (){
      launchUrl(Uri.parse('https://api.whatsapp/+554497009708'));
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Aplicativo de Contato',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          foto,
          nome,
          obs,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              email,
              telefone,
              sms,
              site,
            ],
          ),
        ],
      ),
    );
  }
}
