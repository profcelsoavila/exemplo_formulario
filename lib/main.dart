import 'package:flutter/material.dart';

/// Exemplo de Widget Form

void main() => runApp(const FormExampleApp());

class FormExampleApp extends StatelessWidget {
  const FormExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Exemplo de Formulário')),
        body: const FormExample(),
      ),
    );
  }
}

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  ///GlobalKey usado para formatar, salvar ou validar o formulário
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ///O Widget do aplicativo retorna um Formulário
    return Form(
      ///GlobalKey de validação
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ///campo de entrada de texto
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Digite seu e-mail',
            ),
            ///Validação para campo vazio
            ///Se o valor preenchifo for nulo ou vazio retorna uma mensagem de erro
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, digite um texto';
              }
              return null;
            },
          ),
          ///espaçamento de 6 pixels entre o campo de texto e o botão
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                /// valida o formulário
                /// O ponto de exclamação diz ao flutter que o formulário pode
                /// ser nulo ou não
                if (_formKey.currentState!.validate()) {
                  /// instruções caso o formulário seja validado
                }
              },
              child: const Text('Enviar'),
            ),
          ),
        ],
      ),
    );
  }
}
