import 'package:get/get.dart';
import '../database/database_helper.dart';
import '../model/pessoaModel.dart';


class PessoaController extends GetxController {
  var pessoas = <Pessoa>[].obs;
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<void> addPessoa(Pessoa pessoa) async {
    await _dbHelper.insertPessoa(pessoa);
    loadPessoas();
  }

  Future<void> loadPessoas() async {
    var lista = await _dbHelper.getPessoas();
    pessoas.value = lista;
  }

  Future<void> updatePessoa(Pessoa pessoa) async {
    await _dbHelper.updatePessoa(pessoa);
    loadPessoas();
  }

  Future<void> deletePessoa(Pessoa pessoa) async {
    await _dbHelper.deletePessoa(pessoa.id!);
    loadPessoas();
  }

  @override
  void onInit() {
    super.onInit();
    loadPessoas();
  }
}
