import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';
// import './resposta.dart';
// import './questao.dart';

main() => runApp(PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      "pergunta": "Qual sua cor favorita?",
      "respostas": [
        {'texto': 'preto', 'pontuacao': 10},
        {'texto': 'vermelho', 'pontuacao': 4},
        {'texto': 'verde', 'pontuacao': 3},
        {'texto': 'branco', 'pontuacao': 1},
      ],
    },
    {
      "pergunta": "Qual seu animal favorito?",
      "respostas": [
        {'texto': 'Coelho', 'pontuacao': 4},
        {'texto': 'Cobra', 'pontuacao': 2},
        {'texto': 'Elefante', 'pontuacao': 1},
        {'texto': 'Leão', 'pontuacao': 3},
      ],
    },
    {
      "pergunta": "Qual seu instrutor favorito?",
      "respostas": [
        {'texto': 'Maria', 'pontuacao': 8},
        {'texto': 'João', 'pontuacao': 1},
        {'texto': 'Leo', 'pontuacao': 10},
        {'texto': 'Pedro', 'pontuacao': 5},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPergunta) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    // print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPergunta {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    //final List<Map<String, Object>> perguntas = [

    // Forma imperativa (forma antiga de fazer o for no lugar de map)
    // List<Widget> respostas = [];
    // for (String textResp in perguntas[_perguntaSelecionada]['respostas']) {
    //   respostas.add(Resposta(textResp, _responder));
    // }

    // Forma declarativa
    // List<String> respostas =
    //     temPergunta ? _perguntas[_perguntaSelecionada]['respostas'] : null;
    // /List<Widget> widgets = respostas.map((t) => Resposta(t, _responder)).toList();

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Perguntas'),
      ),
      body: temPergunta
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              fn: _responder)
          : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
