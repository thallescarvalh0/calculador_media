import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarefa Final DPM 2021.2',
      home: FuelForm(),
    );
  }
}
class FuelForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FuelFormState();
}
class _FuelFormState extends State<FuelForm> {

  TextEditingController tcNome = TextEditingController();
  TextEditingController tcEmail = TextEditingController();
  TextEditingController tcNota1 = TextEditingController();
  TextEditingController tcNota2 = TextEditingController();
  TextEditingController tcNota3 = TextEditingController();
  var total = '';

  @override
  Widget build(BuildContext formContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefa Final DPM 2021.2"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(5.0),
            child:Text('CALCULADOR DE MÉDIA',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextField(
              controller: tcNome,
              decoration: InputDecoration(
                hintText: 'NOME',
                labelStyle: Theme.of(context).textTheme.headline6,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextField(
              controller: tcEmail,
              decoration: InputDecoration(
                hintText: 'EMAIL',
                labelStyle: Theme.of(context).textTheme.headline6,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Expanded(child: TextField(
                  controller: tcNota1,
                  decoration: InputDecoration(
                    hintText: 'Nota 1',
                    labelStyle: Theme.of(context).textTheme.headline6,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),),
                Container(
                  width: 15.0,
                ),
                Expanded(child: TextField(
                  controller: tcNota2,
                  decoration: InputDecoration(
                    hintText: 'Nota 2',
                    labelStyle: Theme.of(context).textTheme.headline6,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),),
                Container(
                  width: 15.0,
                ),
                Expanded(child: TextField(
                  controller: tcNota3,
                  decoration: InputDecoration(
                    hintText: 'Nota 3',
                    labelStyle: Theme.of(context).textTheme.headline6,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Expanded(child: ElevatedButton(
                  child: const Text('CALCULA MÉDIA', textScaleFactor: 1.2,),
                  onPressed: () {
                    setState(
                          () {
                            total = calculaMedia();
                      },
                    );
                  },
                ),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children:  <Widget>[
                Expanded(child:
                Text("Resultado: \n\n"
                    "Nome: ${tcNome.text} \n\n"
                    "Email: ${tcEmail.text} \n\n"
                    "Notas: ${tcNota1.text} - ${tcNota2.text} - ${tcNota3.text} \n\n"
                    "Média: $total"
                  , textScaleFactor: 1.2,),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Expanded(child: ElevatedButton(
                  child: const Text('APAGA OS CAMPOS', textScaleFactor: 1.2,),
                  onPressed: () {
                    setState(
                          () {
                            apagaCampos();
                      },
                    );
                  },
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String calculaMedia() {
    double nota1 = double.parse(tcNota1.text);
    double nota2 = double.parse(tcNota2.text);
    double nota3 = double.parse(tcNota3.text);
    double total = ((nota1 + nota2 + nota3)/3);
    return total.toStringAsFixed(2);
  }

  void apagaCampos() {
    tcNota1.text = '';
    tcNota2.text = '';
    tcNota3.text = '';
    tcNome.text = '';
    tcEmail.text = '';
    total = '';
  }
}