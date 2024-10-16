import 'package:flutter/material.dart';
import 'package:mobile/service/transacao.dart';
import 'package:mobile/service/transacaoService.dart';

class TransacaoForm extends StatefulWidget {
  final Transacao? transacao;

  TransacaoForm({this.transacao});

  @override
  _TransacaoFormState createState() => _TransacaoFormState();
}

class _TransacaoFormState extends State<TransacaoForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _saldoController = TextEditingController();
  final Transacaoservice _service = Transacaoservice();

  @override
  void initState() {
    super.initState();
    if (widget.transacao != null) {
      _nomeController.text = widget.transacao!.nome;
      _saldoController.text = widget.transacao!.valor.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.transacao == null
            ? 'Adicionar transacao'
            : 'Editar transacao'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _saldoController,
                decoration: InputDecoration(labelText: 'Saldo'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um valor';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final transacao = transacao(
                      id: widget.transacao?.id ?? '',
                      nome: _nomeController.text,
                      valor: double.parse(_saldoController.text),
                    );
                    if (widget.transacao == null) {
                      _service.create(transacao);
                    } else {
                      _service.update(transacao.id, transacao);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.transacao == null ? 'Adicionar' : 'Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
