import 'package:flutter/material.dart';
import 'package:mobile/screen/formulario.dart';

class BankingHomePage extends StatefulWidget {
  @override
  _BankingHomePageState createState() => _BankingHomePageState();
}

class _BankingHomePageState extends State<BankingHomePage> {
  List<Map<String, dynamic>> clientes = [];

  void adicionarCliente(String nome, double valor) {
    setState(() {
      clientes.add({'nome': nome, 'valor': valor});
    });
  }

  void editarCliente(int index, String nome, double valor) {
    setState(() {
      clientes[index] = {'nome': nome, 'valor': valor};
    });
  }

  void removerCliente(int index) {
    setState(() {
      clientes.removeAt(index);
    });
  }

  // Função para navegar para a tela de formulário
  void irParaFormulario({int? index}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BankingFormPage(
          onSave: index == null
              ? adicionarCliente
              : (String nome, double valor) {
                  editarCliente(index, nome, valor);
                },
          cliente: index != null ? clientes[index] : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes Bancários'),
      ),
      body: ListView.builder(
        itemCount: clientes.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(clientes[index]['nome']),
              subtitle: Text(
                  'Depósito: R\$ ${clientes[index]['valor'].toStringAsFixed(2)}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => irParaFormulario(index: index),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => removerCliente(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => irParaFormulario(),
        child: Icon(Icons.add),
      ),
    );
  }
}

  // Função para navegar para a tela de formulário
  void irParaFormulario({int? index}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BankingFormPage(
          onSave: index == null
              ? adicionarCliente
              : (String nome, double valor) {
                  editarCliente(index, nome, valor);
                },
          cliente: index != null ? clientes[index] : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes Bancários'),
      ),
      body: ListView.builder(
        itemCount: clientes.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(clientes[index]['nome']),
              subtitle: Text(
                  'Depósito: R\$ ${clientes[index]['valor'].toStringAsFixed(2)}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => irParaFormulario(index: index),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => removerCliente(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => irParaFormulario(),
        child: Icon(Icons.add),
      ),
    );
  }
}