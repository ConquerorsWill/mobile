// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const Aplicativo());
}

class Aplicativo extends StatefulWidget {
  const Aplicativo({Key? key}) : super(key: key);

  @override
  State<Aplicativo> createState() => _EstadoAplicativo();
}

class _EstadoAplicativo extends State<Aplicativo> {
  int contador1 = 0;
  int contador2 = 0;
  int _tempo = 60;
  late Timer _timer;
  bool _clique = true;
  Color cor1 = Colors.black;
  Color cor2 = Colors.black;
  double posicao = 0;

  void movimentar (){
    setState(() {
      if (contador1 > contador2){
        posicao = 50.0;
      }else if(contador2 > contador1){

        posicao = MediaQuery.of(context).size.width - 150.0;
      }else {
        posicao = MediaQuery.of(context).size.width / 2 - 50;
      }
    });
  }
  
  

  void _reiniciar() {
    setState(() {
      contador1 = 0;
      contador2 = 0;
      _tempo = 60;
    });
    _timer.cancel();
    _iniciarTimer();
  }
  @override 
  void initState(){
    super.initState();
    _iniciarTimer();
  }
  void dispose(){
    _timer.cancel();
    super.dispose;
  }

  void _iniciarTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_tempo > 0) {
          _tempo--;
        } else {
          _timer.cancel;
          _clique = false;
        }
      });
    });
  }

  void mudarCor() {
    if (contador1 > contador2) {
      cor1 = Colors.red;
      cor2 = Colors.black;
    } else if (contador2 > contador1) {
      cor1 = Colors.black;
      cor2 = Colors.red;
    } else {
      cor1 = Colors.blue;
      cor2 = Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    mudarCor();

    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      
        
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: const Text(
            'Jogo Contador',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body:
        
         Stack (
          
          children: [
         Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Contador 1: $contador1 ',
                style: TextStyle(fontSize: 30, color: cor1),
              ),
              SizedBox(height: 20),
              Text(
                'Contador 2: $contador2 ',
                style: TextStyle(fontSize: 30, color: cor2),
              ),
              SizedBox(height: 30,),
              
              Text(
                'Tempo restante: $_tempo segundos',
                style: TextStyle(fontSize: 30, color: Colors.blueAccent),
              )
            ],
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          bottom: 100.0,
          left: posicao,
          curve: Curves.easeInOut,
          child: Image.network('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/e11f3286-6d58-46d0-bb87-df57a3630762/dd8nuxg-fe3eadf9-c22e-4232-9f8c-bf579bf8e32a.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2UxMWYzMjg2LTZkNTgtNDZkMC1iYjg3LWRmNTdhMzYzMDc2MlwvZGQ4bnV4Zy1mZTNlYWRmOS1jMjJlLTQyMzItOWY4Yy1iZjU3OWJmOGUzMmEuZ2lmIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Vaf8I0xQ8rYaSwFDdV5VsmUpienRgcYVUh4eBJZvFo8',
           width: 100, height: 100,),
        )
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: FloatingActionButton(
                //onPressed: _clique ? (){setState(() {contador1++;}); } : null,
                onPressed: () {
                  setState(() {
                    if (_clique == true){
                    contador1++;
                    movimentar();
                    }
                  });
                },
                tooltip: 'Incrementar Contador 1',
                child: Icon(Icons.add),
              ),
            ),
            FloatingActionButton(
              onPressed: _reiniciar,
              tooltip: 'Zerar Contagem',
              child: Icon(Icons.refresh),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.00),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (_clique == true){
                    contador2++;
                    movimentar();
                    }
                  });
                },
                tooltip: 'Incrementar contador 2',
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
