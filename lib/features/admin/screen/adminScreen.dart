import 'package:flutter/material.dart';

import 'adminHome.dart';

class adminScreen extends StatefulWidget {
  @override
  _adminScreenState createState() => _adminScreenState();
}

class _adminScreenState extends State<adminScreen> {

  int _index=0;
  void _selectPage(int page) {
    setState(() {
      _index = page;
    });
  }
  List<Widget> pages = [
    adminHome(),
    Center(child: Text('add'),),
    Center(child: Text('analayze'),),
    Center(child: Text('Cart'),),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            onTap: _selectPage,
            iconSize: 25,
            elevation: 10,
            selectedFontSize: 12,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analytics'),
              BottomNavigationBarItem(icon: Icon(Icons.production_quantity_limits), label: 'Products'),

            ],
          ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                children: const [
                  Text('Hello',style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal
                  ),),
                  Text(',Admin',style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800
                  ),),
                ],
              ),
            )
          ),
        ),

        body: pages[_index],
      ),
    );
  }
}
