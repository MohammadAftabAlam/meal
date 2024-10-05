import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meals_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    /*required this.onToggleFavourite*/
  });

  final String? title;
  final List<Meal> meals;
  // final void Function(Meal meal) onToggleFavourite;

  @override
  Widget build(BuildContext context) {
    /* *********** If Selected category doesn't have any meal STARTS HERE *********** */
    Widget content = Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Uh oh ... Nothing to show",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Try selecting a different category!",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ],
    ));
    /* *********** If Selected category doesn't have any meal ENDS HERE *********** */

    /* *********** If Selected category has meal STARTS HERE *********** */
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: ((context, index) => MealsItem(
              meal: meals[index],
              // onToggleFavourite: onToggleFavourite,
            )),
      );
    }
    /* *********** If Selected category has meal ENDS HERE *********** */

    /* ************ Single screen for both favourite and meal screen ************ */
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
    /* ************ Single screen for both favourite and meal screen ************ */
  }
}
