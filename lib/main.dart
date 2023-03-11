import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'bottom_bar.dart';
import 'list_register.dart';

void main() => runApp(
    ChangeNotifierProvider(
        create: (context) => ListaDeRegistos(),
        child: const MyApp())
);


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Dashboard';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: BottomBar(),
    );
  }
}



