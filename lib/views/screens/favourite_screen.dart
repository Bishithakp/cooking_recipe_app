import 'package:cooking_recipe_app/views/widgets/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model.dart/recipe_controller.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeController>(builder: (_, mod, __) {
      return Scaffold(
        body: ListView.builder(
            itemBuilder: (context, index) {
              return RecipeCard(
                  recipe: mod.favourite[index], onFavouriteTap: () {
                   mod.setFavourite(recipe: mod.favourite[index]);});
            },
            itemCount: mod.favourite.length),
      );
    });
  }
}
