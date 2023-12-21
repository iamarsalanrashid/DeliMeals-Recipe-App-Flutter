import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  // these bool values change when user toggles the switches in the
  // filters page
  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;

  @override
  void initState() {
    //To save the filter settings in main.dart file of filters selected by the user
    // when after editing we go back to our filters screen.
    _GlutenFree = widget.currentFilters['gluten'] as bool;
    _LactoseFree = widget.currentFilters['lactose'] as bool;
    _Vegan = widget.currentFilters['vegan'] as bool;
    _Vegetarian = widget.currentFilters['vegetarian'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String subtitle, bool currentValue,
      Function(bool newValue) updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            TextButton.icon(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _GlutenFree,
                  'lactose': _LactoseFree,
                  'vegan': _Vegan,
                  'vegetarian': _Vegetarian,
                };
                widget.saveFilters(selectedFilters);
              }, // here we can acces the widget since we are in the stateWidget
              icon: Icon(
                Icons.save,
                color: Colors.white,
              ),
              label: Text('save'),
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust the following Filters',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                      'Gluten-Free',
                      'Only include Gluten-free items meals',
                      _GlutenFree, (newValue) {
                    setState(() {
                      _GlutenFree = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      'Lactose-Free',
                      'Only include Lactose-free items meals',
                      _LactoseFree, (newValue) {
                    setState(() {
                      _LactoseFree = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      'Vegan', 'Only include Vegan items meals', _Vegan,
                      (newValue) {
                    setState(() {
                      _Vegan = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      'Vegetarian',
                      'Only include Vegetarian items meals',
                      _Vegetarian, (newValue) {
                    setState(() {
                      _Vegetarian = newValue;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
