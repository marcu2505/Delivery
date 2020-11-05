import 'package:flutter/material.dart';
import 'package:flutter_login/guardar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBarWidget extends StatefulWidget {
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

void navigateToScreens(index){
  if(index == 0){
    InitScreen();
  }
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        navigateToScreens(index);
      });
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.yellow,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.black,),
          title: Text(
            'Lojas',
            style: TextStyle(color: Colors.black),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.filter_list, color: Colors.black,),
          title: Text(
            'Filtro',
            style: TextStyle(color: Colors.black),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment, color: Colors.black,),
          title: Text(
            'Pedidos',
            style: TextStyle(color: Colors.black),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.black,),
          title: Text(
            'Conta',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
      selectedItemColor: Color(0xFFfd5352),
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
