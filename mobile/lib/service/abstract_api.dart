import 'package:http/http.dart' as http;

abstract class AbstractApi<T> {
  final _urlLocalHost = 'http://localhost:3000';

  String _recurso;

  AbstractApi(this._recurso);

//Buscar todas as transações
  Future<String> getAll() async {
    var response = await http.get(Uri.parse('$_urlLocalHost/$_recurso'));

    return response.body;
  }

// Metodo para postar Transação
  Future<String> post(Object body) async {
    var response =
        await http.post(Uri.parse('$_urlLocalHost/$_recurso'), body: body);

    return response.body;
  }

  Future<String> update(int id, Object body) async {
    var response =
        await http.post(Uri.parse('$_urlLocalHost/$_recurso/$id'), body: body);

    return response.body;
  }
}
