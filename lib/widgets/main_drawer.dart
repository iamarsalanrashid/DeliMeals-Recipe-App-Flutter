import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String text, IconData icon,VoidCallback tapHandler) {
    return ListTile(
      onTap:  tapHandler,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft, // Align the child within the container.
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Cooking Up!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, () {
             Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings, (){
           Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
