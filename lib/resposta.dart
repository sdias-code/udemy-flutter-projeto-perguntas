import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String resposta;
  const Resposta(this.resposta, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      child: Text(resposta),
    );
  }
}
