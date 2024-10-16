import 'package:flutter/material.dart';
import 'package:mobile/service/transacao.dart';

class TransacaoForm extends StatefulWidget {
  final Transacao? Transacao;

  TransacaoForm({this.Transacao});

  @override
  _TransacaoFormState createState() => _TransacaoFormState();
}

class _TransacaoFormState extends State<TransacaoForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _saldoController = TextEditingController();
  final TransacaoService _service = TransacaoService();

  @override
  void initState() {
    super.initState();
    if (widget.Transacao != null) {
      _nomeController.text = widget.Transacao!.nome;
      _saldoController.text = widget.Transacao!.saldo.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Transacao == null
            ? 'Adicionar Transacao'
            : 'Editar Transacao'),
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
                    return 'Por favor, insira um saldo';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final Transacao = Transacao(
                      id: widget.Transacao?.id ?? '',
                      nome: _nomeController.text,
                      saldo: double.parse(_saldoController.text),
                    );
                    if (widget.Transacao == null) {
                      _service.create(Transacao);
                    } else {
                      _service.update(Transacao.id, Transacao);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.Transacao == null ? 'Adicionar' : 'Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
