import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './category_screen.dart';
import './favourites_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Map<String, Object>> _pages = [];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  void initState() {
     _pages = [
    {'page': CategoryScreen(), 'title': 'DeliMeals'},
    {'page': FavouritesScreen(widget.favouriteMeals), 'title': 'Favourites'}
  ];
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        //this helps dart detect the currently selected tap
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
