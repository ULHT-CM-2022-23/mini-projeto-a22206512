import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:mini_projeto/list_register.dart';
import 'package:mini_projeto/bottom_bar.dart';

class Registo extends StatefulWidget {

  const Registo({Key? key}) : super(key: key);

  @override
  _RegistoState createState() => _RegistoState();
}

class _RegistoState extends State<Registo> {
  final _formKey = GlobalKey<FormState>();
  String? _disciplina;
  String? _tipoAvaliacao;
  DateTime? _data;
  int _nivelDificuldade = 1;
  String? _observacoes;
  late RegistoDeAvaliacao avaliacao;
  var registos;

  @override
  void initState() {
    super.initState();
    registos = Provider.of<ListaDeRegistos>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child:
              Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Registo de avaliação',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'O registo aparecerá na lista de avaliações.',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF40434E)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: 'Disciplina',
                          hintText: 'Computação Móvel',
                          prefixIcon: Icon(Icons.book, color: Color(0xFF40434E)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF40434E)),

                          ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o nome da disciplina.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _disciplina = value;
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF40434E)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: 'Avaliação',
                          hintText: 'Tipo de avaliação',
                          prefixIcon: Icon(Icons.task, color: Color(0xFF40434E)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF40434E)),
                    ),
                      ),
                      iconEnabledColor: const Color(0xFF40434E),
                      iconSize: 40,
                      items: const [
                        DropdownMenuItem(
                          value: 'Frequência',
                          child: Text('Frequência'),
                        ),
                        DropdownMenuItem(
                          value: 'Mini-teste',
                          child: Text('Mini-teste'),
                        ),
                        DropdownMenuItem(
                          value: 'Projeto',
                          child: Text('Projeto'),
                        ),
                        DropdownMenuItem(
                          value: 'Defesa',
                          child: Text('Defesa'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _tipoAvaliacao = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o tipo de avaliação.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _tipoAvaliacao = value;
                      },
                    ),
                    ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF40434E)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DateTimeField(
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: 'Data e Hora',
                        prefixIcon: Icon(Icons.access_time, color: Color(0xFF40434E)),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF40434E)),
                        ),
                      ),
                      format: DateFormat('yyyy/MM/dd HH:mm'),
                      validator: (value) {
                        if (value == null) {
                          return 'Por favor, insira a data e hora da realização.';
                        }
                        return null;
                      },
                      onShowPicker: (context, currentValue) async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: currentValue ?? DateTime.now(),
                          firstDate: DateTime.now().subtract(const Duration(days: 0)),
                          lastDate: DateTime(2050),
                        );
                        if (date != null) {
                          // ignore: use_build_context_synchronously
                          final time = await showTimePicker(
                            context: context,
                            //limit the time from 8:00 to 20:00
                            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                            builder: (context, child) {
                              return MediaQuery(
                                data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                child: child!,
                              );
                            },
                          );
                          return _data = DateTimeField.combine(date, time);
                        } else {
                          return currentValue;
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF40434E)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(10),
                      child:Row(
                        children: [
                          const Positioned(
                            left: 0,
                            child: Icon(Icons.handshake_outlined, color: Color(0xFF40434E)),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Dificuldade',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Expanded(
                            child:Slider(
                              value: _nivelDificuldade.toDouble(),
                              min: 1,
                              max: 5,
                              divisions: 4,
                              activeColor: const Color(0xFF40434E),
                              label: {
                                1: 'Muito fácil',
                                2: 'Fácil',
                                3: 'Médio',
                                4: 'Difícil',
                                5: 'Muito difícil',
                              }[_nivelDificuldade],
                              onChanged: (value) {
                                setState(() {
                                  _nivelDificuldade = value.toInt();
                                });
                            },
                          ),
                        ),
                      ]),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF40434E)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      maxLines: 2,
                      maxLength: 200,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: 'Observações',
                          hintText: 'Dica: Trabalho de grupo',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF40434E)),

                        ),
                      ),
                      onSaved: (value) {
                        _observacoes = value;
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF40434E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        avaliacao = RegistoDeAvaliacao(
                          disciplina: _disciplina ?? 'Matemática',
                          tipoAvaliacao: _tipoAvaliacao ?? 'Prova',
                          data: _data ?? DateTime.now(),
                          nivelDificuldade: _nivelDificuldade,
                          observacoes: _observacoes ?? 'Dica: Trabalho de grupo',
                        );

                        // Add the new object and makes it possible to visualize in the list.dart


                          registos.addRegisto(avaliacao);

                        // after the form is saved reset all fields
                        ScaffoldMessenger.of(context).clearSnackBars();

                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('A avaliação foi registada com sucesso.'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      //close dialog
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            }
                        );
                      }
                    },
                    child: const Text('Submeter')
                  ),
                ]
              )
          )
        )
    )
    );
  }
}
