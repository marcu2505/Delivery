import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBarWidget extends StatefulWidget {
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
//        navigateToScreens(index);
      });
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text(
            'Inicio',
            style: TextStyle(color: Color(0xFF2c2b2b)),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          title: Text(
            'Pedidos',
            style: TextStyle(color: Color(0xFF2c2b2b)),
          ),

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text(
            'Conta',
            style: TextStyle(color: Color(0xFF2c2b2b)),
          ),
        ),
      ],
      selectedItemColor: Color(0xFFfd5352),
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
