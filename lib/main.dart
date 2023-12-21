import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meal.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/category_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //Setup for Applying filters.

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] as bool && !meal.isGlutenFree) {
          return false;
        }
        ;
        if (_filters['lactose'] as bool && !meal.isLactoseFree) {
          return false;
        }
        ;
        if (_filters['vegan'] as bool && !meal.isVegan) {
          return false;
        }
        ;
        if (_filters['vegetarian'] as bool && !meal.isVegetarian) {
          return false;
        }
        ;
        return true;
      }).toList();
    });
  }

  // This is setup for setting the  favourite Meals.

  List<Meal> _favouriteMeals = [];

  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);//In this case if the test returns false(i.e. the item is not present then int value will be stored -1.
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavourite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
            colorScheme: ThemeData()
                .colorScheme
                .copyWith(primary: Colors.pink, secondary: Colors.amber),
            canvasColor: Color.fromRGBO(255, 230, 230, 1),
            fontFamily: 'Raleway',
            textTheme: TextTheme(
              titleMedium: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
              bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodySmall: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            )),
        //home: CategoryScreen(),
        initialRoute: '/',
        //default is '/'
        routes: {
          //registering the widgets/screens/pages in the routes table
          '/': (ctx) => TabsScreen(_favouriteMeals),
          CategoryMealsScreen.routeName: (ctx) =>
              CategoryMealsScreen(_availableMeals),
          MealDetailScreen.routeName: (ctx) =>
              MealDetailScreen(_toggleFavourite, _isMealFavourite),
          FiltersScreen.routeName: (ctx) =>
              FiltersScreen(_filters, _setFilters),
        },
        onGenerateRoute: (settings) {
          print(settings.name); // if dynamically the page
          // if (settings.name== '/meal-detail') {
          //   return MaterialPageRoute(builder: (ctx) => CategoryMealsScreen());
          // } else if (settings.name== '/something-else') {
          //   return ...;)
          // }
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => CategoryScreen());
        });
  }
}
