import 'package:flutter/material.dart';
import 'package:flutter_tutorials/models/meal.dart';
import 'package:flutter_tutorials/screens/meal_detail_screen.dart';

class MeanItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;

  const MeanItem({
    Key? key,
    required this.id,
    required this.affordability,
    required this.complexity,
    required this.duration,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Hard:
        return "Hard";
      default:
        return "Unknown";
    }
  }

  String get getAffordability {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Luxurious:
        return "Expensive";
      case Affordability.Pricey:
        return "Pricey";
      default:
        return "Unknown";
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: {"id": id},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    const Icon(Icons.schedule),
                    const SizedBox(
                      width: 6,
                    ),
                    Text("$duration min"),
                  ]),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(getAffordability),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
