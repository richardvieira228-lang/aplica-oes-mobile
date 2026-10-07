import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatefulWidget {
  @override
  State<MeuApp> createState() => MeuAppState();
}

class MeuAppState extends State<MeuApp> {
  // Variáveis para controlar os estados da tela
  String lancheSelecionado = "A";
  bool adicionarQueijo = true; // No layout do exercício inicia marcado
  bool comEntrega = false;
  double quantidade = 1;
  double total = 0.0;

  @override
  void initState() {
    super.initState();
    calcularTotal(); // Calcula o valor inicial ao carregar a tela
  }

  // Função para calcular o valor total com base nas opções selecionadas
  void calcularTotal() {
    double precoBase = 0.0;

    // Preço do lanche escolhido
    if (lancheSelecionado == "A") {
      precoBase = 10.0;
    } else if (lancheSelecionado == "B") {
      precoBase = 15.0;
    } else if (lancheSelecionado == "C") {
      precoBase = 20.0;
    }

    // Adicional de queijo (+ R$ 5 por lanche)
    if (adicionarQueijo) {
      precoBase += 5.0;
    }

    // Multiplica o valor unitário do lanche pela quantidade
    double subtotal = precoBase * quantidade;

    // Adiciona taxa de entrega fixada em R$ 8
    if (comEntrega) {
      subtotal += 8.0;
    }

    setState(() {
      total = subtotal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pedido de Lanche"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- SELEÇÃO DE LANCHE ---
              Text("Escolha o lanche"),
              SizedBox(height: 8),
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: "A", label: Text("A (R\$10)")),
                  ButtonSegment(value: "B", label: Text("B (R\$15)")),
                  ButtonSegment(value: "C", label: Text("C (R\$20)")),
                ],
                selected: {lancheSelecionado},
                onSelectionChanged: (novaSelecao) {
                  setState(() {
                    lancheSelecionado = novaSelecao.first;
                    calcularTotal();
                  });
                },
              ),

              SizedBox(height: 20),

              // --- OPÇÃO DE ADICIONAL DE QUEIJO ---
              Text("Adicionar queijo (+ R\$5)"),
              Checkbox(
                value: adicionarQueijo,
                onChanged: (novoValor) {
                  setState(() {
                    adicionarQueijo = novoValor ?? false;
                    calcularTotal();
                  });
                },
              ),

              SizedBox(height: 20),

              // --- OPÇÃO DE ENTREGA ---
              Text("Entrega (+ R\$8)"),
              Switch(
                value: comEntrega,
                onChanged: (novoValor) {
                  setState(() {
                    comEntrega = novoValor;
                    calcularTotal();
                  });
                },
              ),

              SizedBox(height: 20),

              // --- SELEÇÃO DE QUANTIDADE ---
              Text("Quantidade: ${quantidade.toInt()}"),
              Slider(
                min: 1,
                max: 10,
                value: quantidade,
                onChanged: (novoValor) {
                  setState(() {
                    quantidade = novoValor;
                    calcularTotal();
                  });
                },
              ),

              SizedBox(height: 20),

              // Ícone central conforme a interface do exercício
              Center(
                child: Icon(
                  Icons.calculate,
                  size: 40,
                ),
              ),

              SizedBox(height: 30),

              // --- EXIBIÇÃO DO TOTAL ---
              Text(
                "Total: R\$ ${total.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//import 'package:flutter/material.dart';

// void main() {
//   runApp(MeuApp());
// }

// // Widget principal do app (precisa ser Stateful porque os dados mudam)
// class MeuApp extends StatefulWidget {
//   @override
//   State<MeuApp> createState() => _MeuAppState();
// }

// // Classe que guarda e controla as informações da tela
// class _MeuAppState extends State<MeuApp> {

//   // Guarda se o Switch está ligado (true) ou desligado (false)
//   bool ligado = false;

//   // Guarda se o Checkbox está marcado ou não
//   bool aceito = false;

//   // Guarda o valor do Slider (número decimal)
//   double valor = 50;

//   // Guarda qual opção foi escolhida no SegmentedButton
//   String opcao = "A";

//   void clicarIcone() {
//     // Esse método é chamado quando o botão é clicado
//     print("Clicou no coração");
//     // Mostra mensagem no console (terminal)
//   }

//   void alterarSwitch(bool novoValor) {
//     // Método para atualizar o Switch

//     setState(() {
//       // setState avisa o Flutter para atualizar a tela

//       ligado = novoValor;
//       // Atualiza o valor da variável

//       print(novoValor);
//       // Mostra o novo valor no console
//     });
//   }

//   void alterarCheckbox(bool novoValor) {
//     // Método para atualizar o Checkbox

//     setState(() {
//       aceito = novoValor;
//       print(novoValor);
//     });
//   }

//   void alterarSlider(double novoValor) {
//     // Método para atualizar o Slider

//     setState(() {
//       valor = novoValor;
//       print(novoValor);
//     });
//   }

//   void alterarOpcao(String novaOpcao) {
//     // Método para atualizar o SegmentedButton

//     setState(() {
//       opcao = novaOpcao;
//       print(novaOpcao);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // Estrutura base do aplicativo
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Galeria de Widgets"),
//         ), // AppBar

//         body: Padding(
//           padding: EdgeInsets.all(20),

//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [

//               Text("IconButton"),

//               IconButton(
//                 icon: Icon(Icons.favorite),
//                 onPressed: clicarIcone,
//               ), // IconButton

//               SizedBox(height: 20),

//               // ================= SWITCH =================
//               Text("Switch"),

//               Switch(
//                 value: ligado,

//                 onChanged: (valor) {
//                   alterarSwitch(valor);
//                 },
//               ), // Switch

//               SizedBox(height: 20),

//               // ================= CHECKBOX =================
//               Text("Checkbox"),

//               Checkbox(
//                 value: aceito,
//                 // Valor atual do Checkbox

//                 onChanged: (valor) {
//                   alterarCheckbox(valor ?? false);
//                 },
//               ), // Checkbox

//               SizedBox(height: 20),

//               // ================= SLIDER =================
//               Text("Slider: ${valor.toInt()}"),
//               // Mostra o valor do slider (sem casas decimais)

//               Slider(
//                 min: 0,
//                 // Valor mínimo

//                 max: 100,
//                 // Valor máximo

//                 value: valor,
//                 // Valor atual

//                 onChanged: (novoValor) {
//                   alterarSlider(novoValor);
//                   // Atualiza o valor chamando o método
//                 },
//               ), // Slider

//               SizedBox(height: 20),

//               // ================= SEGMENTED BUTTON =================
//               Text("SegmentedButton"),

//               SegmentedButton<String>(
//                 segments: [
//                   // Lista de opções

//                   ButtonSegment(value: "A", label: Text("Opção A")),
//                   ButtonSegment(value: "B", label: Text("Opção B")),
//                   ButtonSegment(value: "C", label: Text("Opção C")),
//                 ],

//                 selected: {opcao},
//                 // Qual opção está selecionada (precisa ser um Set)

//                 onSelectionChanged: (novaSelecao) {
//                   alterarOpcao(novaSelecao.first);
//                   // Pega a opção escolhida e chama o método
//                 },
//               ), // SegmentedButton
//             ],
//           ), // Column
//         ), // Padding
//       ), // Scaffold
//     ); // MaterialApp
//   }
// }


