import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals_detail.dart';
import 'package:meals/widgets/meals_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsItem extends StatelessWidget {
  const MealsItem({super.key, required this.meal, /*required this.onToggleFavourite*/});

  final Meal meal;
  // final void Function(Meal meal) onToggleFavourite;

  @override
  Widget build(BuildContext context) {
    /* ******** This function is for converting enum type into String type ******** */
    String complexityText() {
      return meal.complexity.name[0].toUpperCase() +
          meal.complexity.name.substring(1);
    }

    String affordibalityText() {
      return meal.affordability.name[0].toUpperCase() +
          meal.affordability.name.substring(1);
    }
    /* ******** This function is for converting enum type into String type ******** */

    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge, // for fitting the image inside card
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MealsDetailsScreen(
                meal: meal,
                // onToggleFavourite: onToggleFavourite,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            /* ********* This is for giving animation to the image when it appear ********* */
            FadeInImage(
              placeholder: MemoryImage(
                  kTransparentImage), // kTransparentImage is provided by 3rd party package
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            /* ********* This is for giving animation to the image when it appear ********* */

            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 44),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow
                          .ellipsis, // Converting long text into ...
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MealsItemTrait(
                          iconData: Icons.schedule,
                          label: "${meal.duration} min",
                        ),
                        MealsItemTrait(
                          iconData: Icons.work,
                          label: complexityText(),
                        ),
                        MealsItemTrait(
                          iconData: Icons.attach_money,
                          label: affordibalityText(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
