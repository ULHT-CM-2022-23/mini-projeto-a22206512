import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_projeto/bottom_bar.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:mini_projeto/pages/list.dart';

import '../list_register.dart';

class Edit extends StatefulWidget {
  final int index;

  Edit({Key? key, required this.index}) : super(key: key);

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit>{

  final _formKey = GlobalKey<FormState>();
  String? _disciplina;
  String? _tipoAvaliacao;
  DateTime? _data;
  int _nivelDificuldade = 1;
  String? _observacoes;
  RegistoDeAvaliacao? avaliacao;
  var registos;

  @override
  void initState() {
    super.initState();
    registos = Provider.of<ListaDeRegistos>(context, listen: false);
    _disciplina = registos.getAllRegistos[widget.index].disciplina;
    _tipoAvaliacao = registos.getAllRegistos[widget.index].tipoAvaliacao;
    _data = registos.getAllRegistos[widget.index].data;
    _nivelDificuldade = registos.getAllRegistos[widget.index].nivelDificuldade;
    _observacoes = registos.getAllRegistos[widget.index].observacoes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar'),
          backgroundColor: const Color(0xFF869D96),
        ),
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
                            'Editar',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'As alterações serão permanentes',
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
                              initialValue: registos.getAllRegistos[widget.index].disciplina,
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
                              value: registos.getAllRegistos[widget.index].tipoAvaliacao,
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
                                  _tipoAvaliacao = value.toString();
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Por favor, insira o tipo de avaliação.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _tipoAvaliacao = value.toString();
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
                              initialValue: registos.getAllRegistos[widget.index].data,
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
                              controller: TextEditingController(text: _observacoes),
                              maxLines: 5,
                              minLines: 3,
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, insira observações.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _observacoes = value;
                              },
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                          children: <Widget>[
                            Expanded(
                              child: ElevatedButton(
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
                                    disciplina: _disciplina.toString(),
                                    tipoAvaliacao: _tipoAvaliacao ?? 'Prova',
                                    data: _data ?? DateTime.now(),
                                    nivelDificuldade: _nivelDificuldade,
                                    observacoes: _observacoes.toString(),
                                  );

                                  // Add the new object and makes it possible to visualize in the list.dart


                                  registos.editRegisto(widget.index,avaliacao);

                                  // after the form is saved reset all fields

                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('O registo de avaliação selecionado foi editado com sucesso.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                // go to list.dart with pop
                                                Navigator.popUntil(context, (route) => route.isFirst);
                                              },
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        );
                                      }
                                  );
                                }
                              },
                              child: const Text('Salvar')
                            ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(150, 50),
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
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('O registo de avaliação selecionado foi eliminado com sucesso.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.popUntil(context, (route) => route.isFirst);
                                                registos.removeRegisto(widget.index);
                                              },
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        );
                                      }
                                  );
                                },
                                child: const Text('Eliminar')
                                ),
                              ),
                            ],
                          ),
                        ]
                    )
                )
            )
        )
    );
  }
}