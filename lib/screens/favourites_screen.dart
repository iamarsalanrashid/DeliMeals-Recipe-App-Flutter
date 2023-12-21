import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);


  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('No favourites are added yet!-start adding some!'),
      );
    }
    else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: favouriteMeals[index].id,
              title: favouriteMeals[index].title,
              imageUrl: favouriteMeals[index].imageUrl,
              complexity: favouriteMeals[index].complexity,
              affordability: favouriteMeals[index].affordability,
              duration: favouriteMeals[index].duration);
        },
        itemCount: favouriteMeals.length,
      );
    };
  }
}
