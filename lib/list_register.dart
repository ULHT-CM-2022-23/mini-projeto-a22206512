import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class RegistoDeAvaliacao {
  final String disciplina;
  final String tipoAvaliacao;
  final DateTime data;
  final int nivelDificuldade;
  final String observacoes;

  RegistoDeAvaliacao({
    required this.disciplina,
    required this.tipoAvaliacao,
    required this.data,
    required this.nivelDificuldade,
    required this.observacoes,
  });

  get getDisciplina => disciplina;
  get getTipoAvaliacao => tipoAvaliacao;
  get getData => data;
  get getNivelDificuldade => nivelDificuldade;
  get getObservacoes => observacoes;
}

class ListaDeRegistos with ChangeNotifier {
  
  final ValueNotifier<List<RegistoDeAvaliacao>> _registos =
  ValueNotifier<List<RegistoDeAvaliacao>>([
    RegistoDeAvaliacao(
        disciplina: "Matemática", tipoAvaliacao: "Frequência",
        data: DateTime.now().add(const Duration(days:8)),
        nivelDificuldade: 3,
        observacoes: "Foi um teste muito difícil"
    ),
    RegistoDeAvaliacao(
        disciplina: "Mat", tipoAvaliacao: "Frequência",
        data: DateTime.now().add(const Duration(days:-2)),
        nivelDificuldade: 3,
        observacoes: "Foi um teste muito difícil"
    ),
    RegistoDeAvaliacao(
        disciplina: "Inglês",
        tipoAvaliacao: "Frequência",
        data: DateTime.now().add(const Duration(days: 5)),
        nivelDificuldade: 4,
        observacoes: "Vai ser um teste muito difícil,"
            "Vai ser um teste muito difícil,vai ser um teste muito difícil,"
            "Vai ser um teste muito difícil"
    ),
    RegistoDeAvaliacao(
        disciplina: "Física",
        tipoAvaliacao: "Frequência",
        data: DateTime.now().add(const Duration(days: 0)),
        nivelDificuldade: 3,
        observacoes: "Foi um teste muito difícil"
    ),
    RegistoDeAvaliacao(
        disciplina: "Química",
        tipoAvaliacao: "Frequência",
        data: DateTime.now().add(const Duration(days: 1)),
        nivelDificuldade: 4,
        observacoes: "Foi um teste muito difícil"
    )
  ]);

  List<RegistoDeAvaliacao> get getAllRegistos => _registos.value;

  void addRegisto(RegistoDeAvaliacao registoDeAvaliacao) {
  _registos.value.add(registoDeAvaliacao);
  notifyListeners();
  }

  void removeRegisto(int index) {
  _registos.value.removeAt(index);
  notifyListeners();
  }

  void getRegisto(int index) {
  _registos.value.elementAt(index);
  }

  void clearList() {
  _registos.value.clear();
  notifyListeners();
  }

  void editRegisto(int index, RegistoDeAvaliacao registoDeAvaliacao) {
  _registos.value[index] = registoDeAvaliacao;
  notifyListeners();
  }

  void orderListByDate(){
    _registos.value.sort((a, b) => a.data.compareTo(b.data));
    notifyListeners();
  }

  bool isRegistoInPast(int index){
    if(_registos.value[index].data.isBefore(DateTime.now())){
      return true;
    }
    return false;
  }

  String getDateInFormat(int index){
    RegistoDeAvaliacao registoDeAvaliacao = _registos.value.elementAt(index);
    String data = DateFormat('yyyy/MM/dd kk:mm').format(registoDeAvaliacao.data);
    return data;
  }

  double getDificuldadesMeanWeek(){
    double dificuldadesMeanWeek = 0;
    List<RegistoDeAvaliacao> registosFromWeek = getRegistosFromWeek();
    for (var i = 0; i < registosFromWeek.length; i++) {
      dificuldadesMeanWeek += registosFromWeek[i].nivelDificuldade;
    }
    dificuldadesMeanWeek = (dificuldadesMeanWeek/registosFromWeek.length).roundToDouble();
    return dificuldadesMeanWeek;
  }

  double getDificuldadesMeanNextWeek(){
    double dificuldadesMeanFromDay7to14 = 0;
    List<RegistoDeAvaliacao> registosFromDay7to14 = getRegistosFromDay7to14();
    for (var i = 0; i < registosFromDay7to14.length; i++) {
      dificuldadesMeanFromDay7to14 += registosFromDay7to14[i].nivelDificuldade;
    }
    dificuldadesMeanFromDay7to14 = (dificuldadesMeanFromDay7to14/registosFromDay7to14.length).roundToDouble();
    return dificuldadesMeanFromDay7to14;
  }

  List<RegistoDeAvaliacao> getRegistosFromWeek(){
    List<RegistoDeAvaliacao> registosFromWeek = [];
    for (var i = 0; i < _registos.value.length; i++) {
      if(_registos.value[i].data.isAfter(DateTime.now().add(const Duration(days: 0))) &&
          _registos.value[i].data.isBefore(DateTime.now().
          add(const Duration(days: 7)))){
        registosFromWeek.add(_registos.value[i]);
      }
    }
    return registosFromWeek;
  }

  List<RegistoDeAvaliacao> getRegistosFromDay7to14() {
    List<RegistoDeAvaliacao> registosFromDay7to14 = [];
    for (var i = 0; i < _registos.value.length; i++) {
      if(_registos.value[i].data.isAfter(DateTime.now().add(const Duration(days: 7))) && _registos.value[i].data.isBefore(DateTime.now().add(const Duration(days: 14)))){
        registosFromDay7to14.add(_registos.value[i]);
      }
    }
    return registosFromDay7to14;
  }

  //Create a funtion that says today, next day or a week day:
  String getDay(RegistoDeAvaliacao registoDeAvaliacao){
    String day = DateFormat('EEEE').format(registoDeAvaliacao.data);
    switch(day){
      case "Monday":
        day = "Segunda-feira";
        break;
      case "Tuesday":
        day = "Terça-feira";
        break;
      case "Wednesday":
        day = "Quarta-feira";
        break;
      case "Thursday":
        day = "Quinta-feira";
        break;
      case "Friday":
        day = "Sext-feira";
        break;
      case "Saturday":
        day = "Sábado";
        break;
      case "Sunday":
        day = "Domingo";
        break;
    }
      if(registoDeAvaliacao.data.isBefore(DateTime.now())){
      day = "Hoje";
      }else if(registoDeAvaliacao.data.isBefore(DateTime.now().add(const Duration(days: 1)))){
      day = "Amanhã";
      }

    return day;
  }

}