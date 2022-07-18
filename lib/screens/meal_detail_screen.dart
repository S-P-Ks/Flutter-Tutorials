import 'package:flutter/material.dart';
import 'package:flutter_tutorials/dummy_dart.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";
  final Function toggleFavorite;
  final Function isMealFavorite;

  const MealDetailScreen(
      {Key? key, required this.toggleFavorite, required this.isMealFavorite})
      : super(key: key);

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        height: 200,
        width: double.infinity,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final MeadData =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == MeadData["id"]);

    final id = MeadData["id"];
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("# ${index + 1}"),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider()
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isMealFavorite(MeadData["id"])
            ? Icon(Icons.star)
            : Icon(Icons.star_border),
        onPressed: () => toggleFavorite(MeadData["id"]),
      ),
    );
  }
}
