import 'package:cooking_recipe_app/model/recipe_model.dart';
import 'package:cooking_recipe_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model.dart/recipe_controller.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipese;
  const RecipeDetailScreen({super.key, required this.recipese});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            recipese.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.fill, image: NetworkImage(recipese.image))),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(recipese.mealType.toString()),
                  Text(recipese.cuisine)
                ],
              )
            ],
          ),
          Row(children: [
            recipeDetails(
                label: 'prep', details: recipese.prepTimeMinutes.toString()),
            recipeDetails(
                label: 'Cook', details: recipese.cookTimeMinutes.toString()),
            recipeDetails(
                label: 'Total',
                details: (recipese.prepTimeMinutes + recipese.cookTimeMinutes)
                    .toString()),
            recipeDetails(
                label: 'Servings', details: recipese.servings.toString()),
          ]),
          Row(children: [
            recipeDetails(label: 'Difficulty', details: recipese.difficulty),
            recipeDetails(
                label: 'Caloreis Per Serving',
                details: recipese.caloriesPerServing.toString())
          ]),
        ]),
      ),
    );
  }

  Padding recipeDetails({required String label, required String details}) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          Text(
            "$label : ",
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: themeColor),
          ),
          Text(
            details,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }
}
