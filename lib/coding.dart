import 'package:flutter/material.dart';

class Alcool_gasolina extends StatefulWidget {
  const Alcool_gasolina({super.key});

  @override
  State<Alcool_gasolina> createState() => _Alcool_gasolinaState();
}

class _Alcool_gasolinaState extends State<Alcool_gasolina> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = '';

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            'Preço inválido, digite valores maiores que 0 e utilizando (.)';
      });
    } else {
      setState(() {
        if (precoAlcool / precoGasolina >= 0.7) {
          setState(() {
             _textoResultado = 'É melhor abastecer com Gasolina';
          });

        } else {
          setState(() {
            _textoResultado = 'É melhor utilizar Álcool';
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alcool ou Gasolina'),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('images/logo.png'),
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                    'Saiba qual a melhor opção para abastecimento do seu carro',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Preco Alcool, ex: 3.50',
                    ),
                    style: TextStyle(fontSize: 20),
                    controller: _controllerAlcool,
                  )),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Preco Gasolina, ex: 5.80',
                ),
                style: TextStyle(fontSize: 20),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: _calcular,
                  child: Text(
                    'Calcular',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    _textoResultado,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
