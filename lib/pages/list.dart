import 'package:flutter/material.dart';
import 'package:mini_projeto/pages/detail.dart';
import '../pages/edit.dart';
import '../list_register.dart';
import 'package:provider/provider.dart';

class Lista extends StatefulWidget {

  Lista({Key? key}) : super(key: key);

  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {

  late ListaDeRegistos listaDeRegistos;

  @override
  Widget build(BuildContext context) {
    listaDeRegistos = Provider.of<ListaDeRegistos>(context);
    if (listaDeRegistos.getAllRegistos.isEmpty) {
      listaDeRegistos.orderListByDate();
    }
    // criar uma lista que recebe as avaliações adicionadas a partir do form no register.dart
    return ChangeNotifierProvider(
      create: (context) => listaDeRegistos,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
              child: Text(
                'Registos',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listaDeRegistos.getAllRegistos.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(listaDeRegistos.getAllRegistos[index].disciplina),
                    direction: DismissDirection.startToEnd,
                    confirmDismiss: (direction) async {
                      return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          if(listaDeRegistos.isRegistoInPast(index)){
                            return AlertDialog(
                              title: const Text('Só podem ser eliminados registos de avaliações futuras.'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    child: const Text('Ok')),
                              ],
                            );
                          }else{
                            return AlertDialog(
                              title: const Text('O registo de avaliação selecionado foi eliminado com sucesso.'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                    },
                                    child: const Text('Ok')),
                              ],
                            );
                          }
                        },
                      );
                    },
                    onDismissed: (direction) {
                      listaDeRegistos.removeRegisto(index);
                    },
                    child:Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    decoration: BoxDecoration(
                      color: const Color(0xffa2c3a4),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xff40434e),
                        width: 1,
                      ),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detail(index: index),
                          ),
                        );
                      },
                      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      title: Text(
                        listaDeRegistos.getAllRegistos[index].disciplina,
                        style: const TextStyle(
                          color: Colors.black, // Define a cor do texto do elemento title
                          fontSize: 16,
                          fontWeight: FontWeight.bold// Define o tamanho da fonte do elemento title
                        ),
                      ),
                      subtitle: Text(
                        '${listaDeRegistos.getAllRegistos[index].tipoAvaliacao}  '
                            '${listaDeRegistos.getDateInFormat(index)}',
                        style: const TextStyle(
                          color: Colors.black, // Define a cor do texto do elemento subtitle
                          fontSize: 16, // Define o tamanho da fonte do elemento subtitle
                        ),
                      ),
                      trailing: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff40434e),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: const Color(0x6f95d398),
                            width: 5,
                          ),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            if(listaDeRegistos.isRegistoInPast(index)){
                              showDialog(context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title: const Text('Só podem ser editados registos de avaliações futuras.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Ok'))
                                    ],
                                  )
                              );
                            }else{
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Edit(index: index)));
                            }
                          },
                        ),
                      ),
                      leading:Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            listaDeRegistos.getAllRegistos[index].nivelDificuldade.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
