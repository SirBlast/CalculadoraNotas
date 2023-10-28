import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora de Notas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _nota1 = TextEditingController();
  final _nota2 = TextEditingController();
  final _nota3 = TextEditingController();
  final _nota4 = TextEditingController();
  double _total = 0;

  void _calcularpromedio() {
    setState(() {

      _total = (double.parse(_nota1.text) + double.parse(_nota2.text) + double.parse(_nota3.text) + double.parse(_nota4.text))/4;
      _total.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body:Padding(
        padding:const EdgeInsets.symmetric(horizontal: 30,vertical: 0),
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Ingrese sus notas:',
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _nota1,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                  labelText: 'Ingrese su nota No.1', // Etiqueta del campo de texto
                  border: OutlineInputBorder(), // Borde del campo de texto
                ),
                keyboardType:TextInputType.number,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _nota2,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                  labelText: 'Ingrese su nota No.2', // Etiqueta del campo de texto
                  border: OutlineInputBorder(), // Borde del campo de texto
                ),
                keyboardType:TextInputType.number,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _nota3,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                  labelText: 'Ingrese su nota No.3', // Etiqueta del campo de texto
                  border: OutlineInputBorder(), // Borde del campo de texto
                ),
                keyboardType:TextInputType.number,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _nota4,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                  labelText: 'Ingrese su nota No.4', // Etiqueta del campo de texto
                  border: OutlineInputBorder(), // Borde del campo de texto
                ),
                keyboardType:TextInputType.number,
              ),
              const SizedBox(height: 60),
              Text(
                'El promedio es: $_total',
                style: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic
                ),
              ),
              ElevatedButton(
                style: style,
                onPressed:() {
                  _calcularpromedio();
                },
                child: Text('Calcular'),
              ),

            ],
          ),
        ),
      ),

       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
