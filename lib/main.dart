import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

main() => runApp(const PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;

  void responder() {
    setState(() {
      perguntaSelecionada++;
    });

    if (kDebugMode) {
      print(perguntaSelecionada);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'pergunta': 'Qual sua cor favorita?',
        'respostas': ['Preto', 'Azul', 'Amarelo', 'Verde'],
      },
      {
        'pergunta': 'Qual seu animal favorito?',
        'respostas': ['Jacaré', 'Leão', 'Zebra', 'Cachorro'],
      },
      {
        'pergunta': 'Qual seu instrutor favorito?',
        'respostas': ['Pedro', 'João', 'André', 'Joana'],
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: [
            Questao(perguntas[perguntaSelecionada]['pergunta'].toString()),
            Resposta('Resposta 1', responder),
            Resposta('Resposta 2', responder),
            Resposta('Resposta 3', responder),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  PerguntaAppState createState() => PerguntaAppState();
}
