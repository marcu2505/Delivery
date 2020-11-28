import 'package:flutter/material.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/screens/FilterPage.dart';
import 'package:flutter_login/screens/HomePage.dart';
import 'package:flutter_login/screens/OrdersPage.dart';
import 'package:flutter_login/screens/ProfilePage.dart';
import 'package:flutter_login/ui/Layout.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  final NavController navController = Get.put(NavController());

  final List<List<Widget>> bodyContent = [
    [HomePage(), FloatingActionButton(
      child: Icon(Icons.shopping_cart, color: Colors.white,),
      backgroundColor: Colors.red,
      onPressed: () {},
    )],
    [FilterPage(), Container()],
    [OrdersPage(), Container()],
    [ProfilePage(), Container()],
  ];

  @override
  Widget build(BuildContext context) {
    return Layout.render(
      content: Obx(
            () => bodyContent.elementAt(navController.selectedIndex)[0],
      ),
      floatingActionButton: Obx(
            () => bodyContent.elementAt(navController.selectedIndex)[1],
      ),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.yellow,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Lojas",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.filter_list),
                  label: "Filtro",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assignment),
                  label: "Pedidos",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Conta",
                ),
              ],
              iconSize: 25,
              selectedIconTheme: IconThemeData(size: 35),
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.black,
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              currentIndex: navController.selectedIndex,
              onTap: (index) => navController.selectedIndex = index,
            ),
      ),
    );
  }
}

class NavController extends GetxController {
  final _selectedIndex = 0.obs;

  get selectedIndex => this._selectedIndex.value;
  set selectedIndex(index) => this._selectedIndex.value = index;
}
