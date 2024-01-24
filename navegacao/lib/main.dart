// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(Aplicativo());
}

class Aplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Pagina1(),
    );
  }
}

class Pagina1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Página 1',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'data:image/png;base64,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',
                width: 300,
                height: 300,
              ),
              const Text(
                'Bem-vindo a tela Inicial',
                style: TextStyle(fontSize: 30),
              ),
              const Text(
                'Flutter é uma ferramente multiplataforma - Android e IOS com um único código',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Pagina2()),
                  );
                },
                child: Text('Ir para página 2'),
              ),
            ],
          ),
        ));
  }
}

class Pagina2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 2'),
        backgroundColor: Colors.green,
      ),

      //ignore : prefer_const_constructors
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://m.media-amazon.com/images/I/51nn2rWyTVL.jpg',
              width: 300,
              height: 300,
            ),
            SizedBox(height: 20),
            Text(
              'linguagem DART',
              style: TextStyle(fontSize: 30),
            ),
            Text(
                'é uma linguagem versátil que combina eficiência e desempenho'
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Pagina3()),
                    );
                  },
                  child: Text('Ir para página 3'),
                ),
          ],
        ),
      ),
    );
  }
}

//Stateless - informações estatícas, não mudam
class Pagina3 extends StatelessWidget {
  //build - responsável pela renderização/construção
  @override
  Widget build(BuildContext context) {
    //define estruturas de layout - appbar + body
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 3'),
        backgroundColor: Colors.orangeAccent,

        //action permite adiconar icone a direita
        actions: [
          //exibe menu pop-up
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Opção 1'),
                  value: 'opcao1',
                ),
                PopupMenuItem(
                  child: Text('Opção 2'),
                  value: 'opcao2',
                ),
              ];
            },
            onSelected: (value) {}, //ação ao selecionar opção
          ),
        ],
      ),
      //corpo do aplicativo - Centralizando esquerda/direita
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, //centralizando acima-baixo
          children: [
            Image.network(
              'https://i0.wp.com/assets.b9.com.br/wp-content/uploads/2012/08/023.jpg?fit=600%2C393&ssl=1',
              width: 300,
              height: 300,
            ),
            Text(
              'A História do Senac',
              style: TextStyle(fontSize: 30),
            ),
            Text(
                'O Senac foi criado no ano 1946, com o propósito de educar profissionalmente'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pagina1()),
                );
              },
              child: Text('Voltar para Página Inicial'),
            ),
          ],
        ),
      ),
    );
  }
}

