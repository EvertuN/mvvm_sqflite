import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewModel/pessoaViewModel.dart';
import 'cadastroPage.dart';

class HomePage extends StatelessWidget {
  final PessoaController pessoaController = Get.put(PessoaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Pessoas")),
      body: Obx(() {
        return ListView.builder(
          itemCount: pessoaController.pessoas.length,
          itemBuilder: (context, index) {
            final pessoa = pessoaController.pessoas[index];
            return ListTile(
              title: Text(pessoa.nome),
              subtitle: Text(pessoa.email),
              leading: IconButton(
                icon: Icon(Icons.edit, color: Colors.blue),
                onPressed: () {
                  Get.to(() => CadastroPage(
                    pessoa: pessoa,
                  ));
                },
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  pessoaController.deletePessoa(pessoa);
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(CadastroPage());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
