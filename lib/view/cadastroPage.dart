import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/pessoaModel.dart';
import '../viewModel/pessoaViewModel.dart';

class CadastroPage extends StatelessWidget {
  final PessoaController pessoaController = Get.find();

  final Pessoa? pessoa;

  CadastroPage({this.pessoa});

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (pessoa != null) {
      nomeController.text = pessoa!.nome;
      emailController.text = pessoa!.email;
    }

    return Scaffold(
      appBar: AppBar(title: Text(pessoa == null ? "Cadastro de Pessoa" : "Editar Pessoa")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: "Nome"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (pessoa == null) {
                  var novaPessoa = Pessoa(
                    nome: nomeController.text,
                    email: emailController.text,
                  );
                  pessoaController.addPessoa(novaPessoa);
                } else {
                  pessoa!.nome = nomeController.text;
                  pessoa!.email = emailController.text;
                  pessoaController.updatePessoa(pessoa!);
                }
                Get.back();
              },
              child: Text(pessoa == null ? "Cadastrar" : "Atualizar"),
            ),
          ],
        ),
      ),
    );
  }
}
