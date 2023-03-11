import 'package:flutter/material.dart';

import 'pages/dashboard.dart';
import 'pages/list.dart';
import 'pages/register.dart';

class BottomBar extends StatefulWidget {

  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  Widget _getPage(int index) {
    if (index == 0) {
      return const Dashboard();
    } else if (index == 1) {
      return Lista();
    } else if (index == 2) {
      return const Registo();
    } else {
      return const SizedBox.shrink();
    }
  }

  Text _getPageTitle(int index) {
    if (index == 0) {
      return const Text('Dashboard');
    } else if (index == 1) {
      return const Text('Lista');
    } else if (index == 2) {
      return const Text('Registo');
    } else {
      return const Text('Erro');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _getPageTitle(_selectedIndex),
        backgroundColor: const Color(0xff869d96),
      ),
      body:_getPage(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 20,
        unselectedFontSize: 14,
        backgroundColor: const Color(0xff869d96),
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lista',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Registo',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
