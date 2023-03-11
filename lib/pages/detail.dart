import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../list_register.dart';


class Detail extends StatefulWidget {

  final int index;

  Detail({Key? key, required this.index}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail>{

  late ListaDeRegistos listaDeRegistos;

  @override
  Widget build(BuildContext context) {
    listaDeRegistos = Provider.of<ListaDeRegistos>(context);
    return ChangeNotifierProvider(
        create: (context) => listaDeRegistos,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Detalhes'),
            backgroundColor: const Color(0xff869d96),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                listaDeRegistos.getAllRegistos[widget.index].disciplina,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Color(0xffc4f1be),
                      offset: Offset(0.5, 0.5),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Card(
                shadowColor: const Color(0xffc4f1be),
                elevation: 5,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  title: const Text(
                      'Avaliação',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Color(0xffc4f1be),
                            offset: Offset(0.5, 0.5),
                          ),
                        ],
                      )
                  ),
                  trailing: Text(
                      listaDeRegistos.getAllRegistos[widget.index].tipoAvaliacao,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Color(0xffc4f1be),
                            offset: Offset(0.5, 0.5),
                          ),
                        ],
                      )
                  ),
                  ),
                ),
              const SizedBox(height: 20),
              Card(
                shadowColor: const Color(0xffc4f1be),
                elevation: 5,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  title: const Text(
                      'Dificuldade',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Color(0xffc4f1be),
                            offset: Offset(0.5, 0.5),
                          ),
                        ],
                      )
                  ),
                  trailing: Text(
                      listaDeRegistos.getAllRegistos[widget.index].nivelDificuldade.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Color(0xffc4f1be),
                            offset: Offset(0.5, 0.5),
                          ),
                        ],
                      )
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                shadowColor: const Color(0xffc4f1be),
                elevation: 5,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  title: const Text(
                      'Data',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Color(0xffc4f1be),
                            offset: Offset(0.5, 0.5),
                          ),
                        ],
                      )
                  ),
                  trailing: Text(
                      listaDeRegistos.getDateInFormat(widget.index),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Color(0xffc4f1be),
                            offset: Offset(0.5, 0.5),
                          ),
                        ],
                      )
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                shadowColor: const Color(0xffc4f1be),
                elevation: 5,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  title: const Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Text(
                        'Observações',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 5.0,
                              color: Color(0xffc4f1be),
                              offset: Offset(0.5, 0.5),
                            ),
                          ],
                        )
                        ),
                  ),
                  subtitle: Text(
                      listaDeRegistos.getAllRegistos[widget.index].observacoes,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Color(0xffc4f1be),
                            offset: Offset(0.5, 0.5),
                          ),
                        ],
                      )
                  ),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  foregroundColor: const Color(0xff40434e),
                  backgroundColor: const Color(0xff869d96),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Partilhar',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Color(0xffc4f1be),
                        offset: Offset(0.5, 0.5),
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  Share.share(
                      'Mensagem do Dealer!!\n\n'
                      'Vamos ter avaliação de ${listaDeRegistos.getAllRegistos[widget.index].disciplina},'
                      ' em ${listaDeRegistos.getDateInFormat(widget.index)},'
                      'com a dificuldade de ${listaDeRegistos.getAllRegistos[widget.index].nivelDificuldade}'
                      ' numa escala de 1 a 5.\n\n'
                      'Observações para esta avaliação:\n'
                      '${listaDeRegistos.getAllRegistos[widget.index].observacoes}'
                  );
                },
              ),
            ],
          )
        )
    );
  }
}