import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BD {
  // // criaremos uma variável static, pois nunca irá mudar
  static final BD _instance = new BD.internal();

  // criaremos uma classe factory porque não será recriada sempre que chamarmos a classe BD (POO)
  factory BD() {
    // print('teste');
    return _instance;
  }

  // // internal é um construtor então toda vez que precisamos é só instanciá-lo
  BD.internal();

  // //Database é a classe do SQFlite que iremos usar, por isso iremos criá-la
  static Database _db;

  // sempre que formos acessar alguma coisa utilizar o future, pois ele é uma transação alheia
  Future<Database> get db async {
    // print('UUUUU');
    // se o _db existe na memória
    if (_db != null) {
      // print('xxxxx');
      //caso exista, retorna este _bd existente
      return _db;
    }

    // print('AAAAAAAAAAA');
    // chamamos agora o initBd que irá iniciar o nosso banco de dados
    _db = await initBd();

    return _db;
  }

  // // iniciando nosso banco de dados em async pois ele é uma transição
  initBd() async {
    // Directory faz parte do plugin dart:io e o getApplicationDocumentsDirectory() faz parte do path_provider
    // aqui nós estamos acessando o diretório nativo do android
    Directory documentoDiretorio = await getApplicationDocumentsDirectory();

    // o join() junta duas coisas, no caso iremos juntar o diretorio juntamente com o nosso banco de dados
    String caminho = join(documentoDiretorio.path, "agenda.db");

    // após ter acesso ao local do nosso BD, iremos abri-lo
    var nossoBD = await openDatabase(caminho, version: 1, onCreate: _onCreate);
    return nossoBD;
  }

  //criando o método _onCreate que irá criar o nosso BD
  void _onCreate(Database db, int version) async {
    // aqui iremos colocar o SQL que é outra linguagem, por isso, colocaremos
    // dentro de aspas, pois é string

    await db.execute(
        "CREATE TABLE if not exists pessoas (cd_pessoa INTEGER PRIMARY KEY,"
        "nm_pessoa TEXT,"
        "nr_telefone TEXT)");
  }

  Future<int> inserir(String tabela, Map mapa) async {
    var bdCliente = await db;
    int res = await bdCliente.insert(tabela, mapa);
    return res;
  }

  Future<int> alterar(
      String tabela, Map mapa, String campopk, int valorpk) async {
    var bdCliente = await db;
    int res = await bdCliente
        .update(tabela, mapa, where: "$campopk=?", whereArgs: [valorpk]);
    return res;
  }

  // para podermos pegar os usuarios criados
  Future<List> listar(String tabela) async {
    // praticamente iremos fazer a mesma coisa da função de inserir
    var bdCliente = await db;

    // rawQuery é como se fosse um pedido, então iremos solicitar todos os dados
    var res = await bdCliente.rawQuery("SELECT * FROM " + tabela);
    // agora iremos retornar uma list
    return res.toList();
  }

  // para podermos pegar os usuarios criados
  Future<List> Buscar(String tabela, String campo, int codigo) async {
    // praticamente iremos fazer a mesma coisa da função de inserir
    var bdCliente = await db;

    // rawQuery é como se fosse um pedido, então iremos solicitar todos os dados
    var res = await bdCliente.rawQuery("SELECT * FROM " +
        tabela +
        " where " +
        campo +
        "=" +
        codigo.toString());
    // agora iremos retornar uma list
    return res.toList();
  }
}
