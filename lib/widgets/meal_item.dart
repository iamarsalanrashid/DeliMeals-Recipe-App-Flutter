import 'package:flutter/material.dart';

import '../screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;

  MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.complexity,
    required this.affordability,
    required this.duration,
  });

   SelectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,
    arguments: id);
  }

  String get complexityText{
    switch(complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
      return 'Challenging';
      break;
      case Complexity.Hard:
      return 'Hard';
      break;
      default :
        return 'Unknown';
    }
  }

  String get affordabilityText{
    switch(affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default :
        return 'Unknown';
    }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectMeal(context) ,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(10),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect( //To shape our image according to the rounded corner card
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ) ,
                Positioned( // to shape our text of title on image
                  bottom: 20,
                  right: 10,
                  left: 10,
                  child: Container(
                    width: double.infinity,
                    color: Colors.black26, // black with 54 pc opacity
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                Row(
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(
                      width: 6,
                    ),
                    Text('$duration min'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(
                      width: 6,
                    ),
                    Text(complexityText),
                  ],
                ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 6,
                        ),
                        Text(affordabilityText),
                      ],
                    )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
