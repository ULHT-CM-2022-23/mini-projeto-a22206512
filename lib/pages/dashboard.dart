import 'package:flutter/material.dart';
import 'package:mini_projeto/list_register.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {

  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    ListaDeRegistos listaDeRegistos = Provider.of<ListaDeRegistos>(context);
    setState(() {
      listaDeRegistos.orderListByDate();
    });
    double dificuldadeMedia = listaDeRegistos.getDificuldadesMeanWeek();
    double dificuldadeMediaProximaSemana = listaDeRegistos.getDificuldadesMeanNextWeek();
    return ChangeNotifierProvider(
      create: (context) => listaDeRegistos,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 20),
              child: Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                'Média das avaliações da semana',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
              decoration: BoxDecoration(
                color: const Color(0xffa2c3a4),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xff40434e),
                  width: 3,
                ),
              ),
              child: Text(
                  dificuldadeMedia.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                'Média das avaliações da próxima semana',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
              decoration: BoxDecoration(
                color: const Color(0xffa2c3a4),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xff40434e),
                  width: 3,
                ),
              ),
              child: Text(
                dificuldadeMedia.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // create listview of registos from the week
            ListView(
              shrinkWrap: true,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    'Avaliações da semana',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ...listaDeRegistos.getRegistosFromWeek().map((registo) => ListTile(
                  title: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text(
                      registo.disciplina,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  subtitle:Text(
                      listaDeRegistos.getDay(registo),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff40434e),
                      ),
                    ),
                )).toList(),
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }

}