import 'package:flutter/material.dart';
import './resposta.dart';
import './questao.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) fn;

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.fn,
  });

  bool get temPergunta {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas =
        temPergunta ? perguntas[perguntaSelecionada]['respostas'] : null;

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['pergunta']),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'],
            () => fn(resp['pontuacao']),
          );
        }).toList(),
      ],
    );
  }
}
