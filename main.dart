import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  @override

  String dropdownvalue = 'Selecione';
  var items = [
    'Selecione',
    'Abaixo de 1 salário mínimo',
    'Entre 1 e 2 salários mínimos',
    'Maior que 2 salários mínimos',
  ];

  String dropdownvalue2 = 'Selecione';
  var filhos = [
    'Selecione',
    'Nenhum',
    'até 2',
    '3 ou mais',
  ];

  String? vacinados;
  String? mae;

  String _infoText = "Informe seus dados";

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields(){
    setState(() {
      dropdownvalue = 'Selecione';
      dropdownvalue2 = "Selecione";
      vacinados = "";
      mae = "";
      _infoText = "Informe seus dados";
    });
  }

  void _calculate(){

    setState(() {
      if (dropdownvalue == "Maior que 2 salários mínimos" || dropdownvalue2 == "Nenhum"|| vacinados == "nao")
          {
        _infoText = "Você não tem direito ao auxílio...";
      }
      else if (dropdownvalue == "Abaixo de 1 salário mínimo" && dropdownvalue2 == "até 2" && vacinados == "sim" && mae == "nao")
      {
        _infoText = "Você tem direito ao auxílio de 2,5 salários mínimos.";
      }
      else if (dropdownvalue == "Entre 1 e 2 salários mínimos" && dropdownvalue2 == "até 2" && vacinados == "sim" && mae == "nao")
      {
        _infoText = "Você tem direito ao auxílio de 1,5 salário mínimo.";
      }
      else if ((dropdownvalue == "Entre 1 e 2 salários mínimos" || dropdownvalue == "Abaixo de 1 salário mínimo") && dropdownvalue2 == "3 ou mais" && vacinados == "sim" && mae == "nao")
      {
        _infoText = "Você tem direito ao auxílio de 3 salários mínimos .";
      }
      else if (dropdownvalue == "Abaixo de 1 salário mínimo" && dropdownvalue2 == "até 2" && vacinados == "sim" && mae == "sim")
      {
        _infoText = "Você tem direito ao auxílio de 3 salários mínimos.";
      }
      else if (dropdownvalue == "Entre 1 e 2 salários mínimos" && dropdownvalue2 == "até 2" && vacinados == "sim" && mae == "sim")
      {
        _infoText = "Você tem direito ao auxílio de 2 salário mínimo.";
      }
      else if ((dropdownvalue == "Entre 1 e 2 salários mínimos"|| dropdownvalue == "Abaixo de 1 salário mínimo") && dropdownvalue2 == "3 ou mais" && vacinados == "sim" && mae == "sim")
      {
        _infoText = "Você tem direito ao auxílio de 3,5 salários mínimos.";
      }

    });
  }

  Widget build(BuildContext context){
    return Scaffold (
        appBar: AppBar(
          title: Text("Bolsa família", style: TextStyle(color: Colors.black, fontSize:25.0,)),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh),
                onPressed: _resetFields),
          ],
        ),
        backgroundColor: Colors.white12,

        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: <Widget>[
                    Icon(Icons.monetization_on_outlined, size: 80.0, color: Colors.greenAccent,),

                    Divider(),

                    Text("Selecione a renda da sua família:", textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize:21.0,)),

                    DropdownButton(
                        value: dropdownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        style: TextStyle(color: Colors.greenAccent, fontSize: 20.0),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;}
                          );}),

                    Divider(),
                    Divider(),

                    Text("Selecione quantos filhos na escola há em sua família:", textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize:21.0,)),

                    DropdownButton(
                        value: dropdownvalue2,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        style: TextStyle(color: Colors.greenAccent, fontSize: 20.0),
                        items: filhos.map((String filhos) {
                          return DropdownMenuItem(
                            value: filhos,
                            child: Text(filhos),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue2 = newValue!;}
                          );}),

                    Divider(),
                    Divider(),

                    Text("Os filhos estão com as vacinas em dia?", textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize:21.0,)),

                    RadioListTile(
                      title: Text("Sim", style: TextStyle(color: Colors.greenAccent, fontSize:18.0,)),
                      value: "sim",
                      groupValue: vacinados,
                      onChanged: (value){
                        setState(() {
                          vacinados = value.toString();
                        });
                      },
                    ),

                    RadioListTile(
                      title: Text("Não", style: TextStyle(color: Colors.greenAccent, fontSize:18.0,)),
                      value: "nao",
                      groupValue: vacinados,
                      onChanged: (value){
                        setState(() {
                          vacinados = value.toString();
                        });
                      },
                    ),

                    Divider(),
                    Divider(),

                    Text("A chefe da família é mãe solteira?", textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize:21.0,)),

                    RadioListTile(
                      title: Text("Sim", style: TextStyle(color: Colors.greenAccent, fontSize:18.0,)),
                      value: "sim",
                      groupValue: mae,
                      onChanged: (value){
                        setState(() {
                          mae = value.toString();
                        });
                      },
                    ),

                    RadioListTile(
                      title: Text("Não", style: TextStyle(color: Colors.greenAccent, fontSize:18.0,)),
                      value: "nao",
                      groupValue: mae,
                      onChanged: (value){
                        setState(() {
                          mae = value.toString();
                        });
                      },
                    ),


                    Padding(padding: EdgeInsets.only(top: 20.0, bottom:20.0),
                        child: Container(
                            height:50.0,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate())
                                    _calculate();
                                },
                                child: Text("Calcular", style: TextStyle(color: Colors.black, fontSize:25.0)),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.greenAccent),)
                            )
                        )

                    ),
                    Text("$_infoText\n", textAlign: TextAlign.center, style: TextStyle(color: Colors.greenAccent, fontSize:25.0,)),



                ])
            )));
  }
}