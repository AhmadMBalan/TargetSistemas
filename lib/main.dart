// 1) SOMA = 91

// 2)
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estagio',
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/second': (context) => SecondPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  String _mensagem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fibonacci'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Digite um número'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int numero = int.tryParse(_controller.text) ?? 0;
                if (verificarFibonacci(numero)) {
                  setState(() {
                    _mensagem = '$numero pertence à sequência de Fibonacci.';
                  });
                } else {
                  setState(() {
                    _mensagem =
                    '$numero não pertence à sequência de Fibonacci.';
                  });
                }
              },
              child: Text('Verificar'),
            ),
            SizedBox(height: 20),
            Text(_mensagem),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: Text('Invertidor de String'),
            ),
          ],
        ),
      ),
    );
  }

  bool verificarFibonacci(int numero) {
    int a = 0, b = 1;

    while (b <= numero) {
      if (b == numero) {
        return true;
      }
      int temp = a;
      a = b;
      b = temp + b;
    }

    return false;
  }
}

// 3)
// a) 9
// b) 128
// c) 49
// d) 64
// e) 13
// f) 20

// 4) Ligamos o interruptor 1 por alguns minutos, desligamos,
// e em seguida ligamos o interruptor 2 e vamos até a outra sala.
// A lâmpada que estiver acesa corresponde ao interruptor 2,
// a que estiver quente ao interruptor 1, e a lâmpada que resta só
// pode ser do interruptor 3.

// 5)

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController _inputController = TextEditingController();
  String _resultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inverter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _inputController,
              decoration: InputDecoration(labelText: 'Digite uma string'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String entrada = _inputController.text;
                String resultado = inverterString(entrada);
                setState(() {
                  _resultado = resultado;
                });
              },
              child: Text('Inverter'),
            ),
            SizedBox(height: 20),
            Text('String invertida: $_resultado'),
          ],
        ),
      ),
    );
  }

  String inverterString(String s) {
    List<String> listaCaracteres = s.split('');

    int tamanho = listaCaracteres.length;

    for (int i = 0; i < tamanho ~/ 2; i++) {
      String temp = listaCaracteres[i];
      listaCaracteres[i] = listaCaracteres[tamanho - i - 1];
      listaCaracteres[tamanho - i - 1] = temp;
    }

    return listaCaracteres.join();
  }
}
