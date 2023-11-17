import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';
import 'resultado.dart';

main() => runApp(const PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas = const [
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

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // List<Widget> respostas = [];

    // for (var resp in _perguntas[_perguntaSelecionada]['respostas'] as List) {
    //   respostas.add(Resposta(resp, responder));
    // }

    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas'] as List<String>
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: <Widget>[
                  Questao(
                      _perguntas[_perguntaSelecionada]['pergunta'].toString()),
                  ...respostas
                      .map((resp) => Resposta(resp, _responder))
                      .toList(),
                ],
              )
            : const Resultado("Parabéns!"),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  PerguntaAppState createState() => PerguntaAppState();
}
