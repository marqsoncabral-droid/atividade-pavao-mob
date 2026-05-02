import 'dart:math';

import 'package:mobx/mobx.dart';

import 'dados_app.dart';

class LojaStore {
  ObservableList<double> precosProdutos = ObservableList<double>();
  late Action trocarValores;
  Random sorteio = Random();

  LojaStore() {
    trocarValores = Action(() {
      precosProdutos.clear();

      for (int i = 0; i < produtosTela.length; i++) {
        precosProdutos.add(gerarPreco());
      }
    });

    randomizarPrecos();
  }

  double gerarPreco() {
    return (100 + sorteio.nextInt(900)).toDouble();
  }

  void randomizarPrecos() {
    trocarValores();
  }
}
