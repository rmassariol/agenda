import 'package:agenda/ui/bd.dart';

class Pessoas {
  int cdPessoa;
  String nmPessoa;
  String nrTelefone;

  var db = new BD();

  Pessoas({this.cdPessoa, this.nmPessoa, this.nrTelefone});

  // String get getnmPessoa => _nmPessoa;
  // String get getnrTelefone => _nrTelefone;
  // int get getcdPessoa => _cdPessoa;

  Pessoas.jsonParaMap(Map<String, dynamic> json) {
    this.nmPessoa = json['nm_pessoa'];
    this.nrTelefone = json['nr_telefone'];
    this.cdPessoa = json['cd_pessoa'];
  }

  Map<String, dynamic> mapaParaJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cd_pessoa'] = this.cdPessoa;
    data['nm_pessoa'] = this.nmPessoa;
    data['nr_telefone'] = this.nrTelefone;
    return data;
  }

  Future<int> inserirPessoa(Pessoas pessoa) async {
    int res = await db.inserir("pessoas", pessoa.mapaParaJson());
    return res;
  }

  Future<int> alterarPessoa(Pessoas pessoa) async {
    int res = await db.alterar(
        "pessoas", pessoa.mapaParaJson(), "cd_pessoa", this.cdPessoa);
    return res;
  }

  Future<List> listarPessoas() async {
    List res = await db.listar("pessoas");
    return res.toList();
  }

  Future<List> buscaPessoas() async {
    List res = await db.Buscar("pessoas", "cd_pessoa", this.cdPessoa);
    return res.toList();
  }
}
