import 'dart:io';

void exercicio1() {
  String? nomeProduto;
  double valorProduto = 0.0;
  List<Map<String, dynamic>> listaProdutos = [];

  print('Olá, seja bem-vindo(a) ao cadastro de produtos.');

  while (true) {
    while (nomeProduto?.isEmpty ?? true) {
      print('\nDigite o nome do produto:');
      nomeProduto = stdin.readLineSync();
      if (nomeProduto?.isEmpty ?? true) {
        print('Oops, parece que você não digitou nada.');
      }
    }

    print('\nDigite o valor do produto:');
    valorProduto = double.parse(stdin.readLineSync()!);
    listaProdutos.add({'Nome': nomeProduto!, 'Valor': valorProduto});

    print('\nPRODUTO ADICIONADO COM SUCESSO!');
    print('\nDeseja adicionar mais um produto?(s/n):');
    String? resposta = stdin.readLineSync();

    if (resposta?.toLowerCase() == 'n') {
      print('\nLista de produtos cadastrados:\n');
      double valorTotal = 0;

      for (var produto in listaProdutos) {
        valorTotal += produto['Valor'];
        print('Nome: ${produto['Nome']}');
        print('Valor: R\$ ${produto['Valor'].toStringAsFixed(2)}');
        print('======================\n');
      }

      print('VALOR TOTAL GERAL: R\$ ${valorTotal.toStringAsFixed(2)}');
      break;
    }
    nomeProduto = null;
    valorProduto = 0.0;
  }
}

void exercicio2() {
  String? nomeProduto;
  double valorProduto = 0.0;
  int quantidadeProduto = 0;
  List<Map<String, dynamic>> listaProdutos = [];

  print('Olá, seja bem-vindo(a) ao cadastro de produtos.');

  while (true) {
    while (nomeProduto?.isEmpty ?? true) {
      print('\nDigite o nome do produto:');
      nomeProduto = stdin.readLineSync();
      if (nomeProduto?.isEmpty ?? true) {
        print('Oops, parece que você não digitou nada.');
      }
    }

    print('\nDigite a quantidade de unidades:');
    quantidadeProduto = int.parse(stdin.readLineSync()!);
    print('\nDigite o valor do produto:');
    valorProduto = double.parse(stdin.readLineSync()!);

    listaProdutos.add({'Nome': nomeProduto, 'Quantidade': quantidadeProduto, 'Valor': valorProduto});

    print('\nPRODUTO ADICIONADO COM SUCESSO!');
    print('\nDeseja adicionar mais um produto?(s/n):');
    String? resposta = stdin.readLineSync();

    if (resposta?.toLowerCase() == 'n') {
      print('\nLista de produtos cadastrados:\n');
      double valorTotalGeral = 0;

      for (var produto in listaProdutos) {
        double valorTotalProduto = produto['Quantidade'] * produto['Valor'];
        valorTotalGeral += valorTotalProduto;
        print('Nome: ${produto['Nome']}');
        print('Quantidade: ${produto['Quantidade']}');
        print('Valor Unitário: R\$ ${produto['Valor'].toStringAsFixed(2)}');
        print('Valor Total: R\$ ${valorTotalProduto.toStringAsFixed(2)}');
        print('======================\n');
      }

      print('VALOR TOTAL GERAL: R\$ ${valorTotalGeral.toStringAsFixed(2)}');
      break;
    }
    nomeProduto = null;
    valorProduto = 0.0;
  }
}

void exercicio3() {
  List<Map<String, dynamic>> produtos = [
    {'Nome': 'Carro', 'Código': 1, 'Valor': 15000.00},
    {'Nome': 'Moto', 'Código': 2, 'Valor': 6000.00},
    {'Nome': 'Lancha', 'Código': 3, 'Valor': 100000.00},
    {'Nome': 'Bicicleta', 'Código': 4, 'Valor': 1000.00},
    {'Nome': 'Quadriciclo', 'Código': 5, 'Valor': 30000.00},
    {'Nome': 'Skate', 'Código': 6, 'Valor': 600.00},
    {'Nome': 'Jogo de Jantar', 'Código': 7, 'Valor': 800.00},
    {'Nome': 'Copo', 'Código': 8, 'Valor': 15.00},
    {'Nome': 'Garfo', 'Código': 9, 'Valor': 5.00},
    {'Nome': 'Colher', 'Código': 10, 'Valor': 5.00},
  ];

  print('\nOlá, bem-vindo(a)!');
  print('Pesquise um produto e solicite a quantidade desejada.\n');
  
  print('Digite o código do produto: ');
  int? codigo = int.tryParse(stdin.readLineSync() ?? '');

  var produto = produtos.firstWhere((p) => p['Código'] == codigo, orElse: () => {});

  if (produto.isEmpty) {
    print('\nDesculpa, mas não conseguimos achar o produto com esse código em nosso sistema.\n');
    return;
  }

  print('\nProduto selecionado: ${produto['Nome']}');
  print('Valor unitário: R\$ ${produto['Valor'].toStringAsFixed(2)}\n');

  print('Digite a quantidade necessária: ');
  int? quantidade = int.tryParse(stdin.readLineSync() ?? '');

  if (quantidade == null || quantidade <= 0) {
    print('\nQuantidade inválida!\n');
    return;
  }

  double total = quantidade * produto['Valor'];
  print('\nTotal: ${quantidade} x R\$ ${produto['Valor'].toStringAsFixed(2)} = R\$ ${total.toStringAsFixed(2)}\n');
}

void main() {
  while (true) {
    print('\nEscolha um exercício para executar:');
    print('1 - Cadastro de produtos simples');
    print('2 - Cadastro de produtos com quantidade');
    print('3 - Pesquisa de produtos por código');
    print('0 - Sair');
    
    int? escolha = int.tryParse(stdin.readLineSync() ?? '');
    if (escolha == null) {
      print('\nEscolha inválida!');
      continue;
    }

    if (escolha == 0) {
      print('Encerrando o programa.');
      break;
    }
    
    switch (escolha) {
      case 1:
        exercicio1();
        break;
      case 2:
        exercicio2();
        break;
      case 3:
        exercicio3();
        break;
      default:
        print('\nOpção inválida! Tente novamente.');
    }
  }
}