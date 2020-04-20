import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencias/formulario.dart';
import 'package:flutter/material.dart';

const _tituloAppbar = 'Transferências';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencias>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppbar),
      ),
      body: ListView.builder(
        itemCount:widget._transferencias.length,
        itemBuilder:(context, indice){
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add), onPressed: () {
       Navigator.push(
            context, MaterialPageRoute(builder: (context) {
          return FormularioTransferencia();
        })).then((transferenciaRecebida) =>
            _atualiza(transferenciaRecebida));
      },
      ),
    );
  }

  void _atualiza(Transferencia transferenciaRecebida) {
        if(transferenciaRecebida != null){
      setState((){
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }

}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferecia;

  ItemTransferencia(this._transferecia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transferecia.valor.toString()),
          subtitle: Text(_transferecia.numeroConta.toString()),
        ));
  }
}