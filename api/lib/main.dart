// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(Principal());
}

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo com API',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: home(),
    );
  }
}

class home extends StatefulWidget {
  @override
  home_state createState() => home_state();
}

class home_state extends State<home> {
  TextEditingController controleTexto = TextEditingController();
  String conteudo = '';
  String imagem = '';

  Future<void> buscar() async {
    String entrada = controleTexto.text;
    String url = 'https://pt.wikipedia.org/api/rest_v1/page/summary/$entrada';

    final resposta = await http.get(Uri.parse(url));

    if (resposta.statusCode == 200) {
      Map<String, dynamic> dado = json.decode(resposta.body);
      setState(() {
        conteudo = dado['extract'];
        imagem = dado['originalimage']['source'];
      });
    } else {
      conteudo = 'nada foi encontrado!  ';
      imagem = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Aplicativo com API'),
          backgroundColor: Colors.indigo,
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'data:image/jpeg;base64,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'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(106.0),
              child: Center(
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                controller: controleTexto,
                                decoration: const InputDecoration(
                                  labelText: 'Digite o text',
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: buscar,
                              child: Icon(Icons.search, color: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.indigo),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          'Resultado',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(conteudo, style: TextStyle(fontSize: 16.0)),
                        const SizedBox(height: 20),
                        if (imagem.isNotEmpty)
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ImagemTelaInteira(imagemParametro: imagem),
                                ),
                              );
                            },
                          
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Image.network(
                              imagem,
                              height: 150,
                            ),
                          ),
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class ImagemTelaInteira extends StatelessWidget {
  final String imagemParametro;
  ImagemTelaInteira({required this.imagemParametro});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: imagemParametro,
          child: Image.network(imagemParametro),
        ),
      ),

    );
  }
}
