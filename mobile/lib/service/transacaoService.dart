import 'package:mobile/service/abstract_api.dart';
import 'package:mobile/service/transacao.dart';

class Transacaoservice extends AbstractApi<Transacao> {
  Transacaoservice() : super('http://localhost:3000/registros');
}
