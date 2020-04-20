import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _rotuloCampoConta = 'Número da conta';
const _dicaCampoConta = '0000';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {



  @override
  State<StatefulWidget> createState() {

    return FormularioTransferenciaState();
  }
}
class FormularioTransferenciaState extends State<FormularioTransferencia>{
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controlador: _controladorCampoNumeroConta,
                dica: _dicaCampoConta,
                rotulo: _rotuloCampoConta,
              ),
              Editor(
                  controlador: _controladorCampoValor,
                  rotulo:_rotuloCampoValor,
                  dica: _dicaCampoValor,
                  icone: Icons.monetization_on),
              RaisedButton(
                child: Text(_textoBotaoConfirmar),
                onPressed: () {
                  _criaTransferencia(context);
                },
              )
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context ) {
    final int numeroConta =
    int.tryParse(_controladorCampoNumeroConta.text);
    final double Valor =
    double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && Valor != null) {
      final transferenciaCriada = Transferencia(Valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}