import 'package:cooking_recipe_app/model/recipe_model.dart';
import 'package:cooking_recipe_app/utils/colors.dart';
import 'package:cooking_recipe_app/utils/constants.dart';
import 'package:cooking_recipe_app/view_model.dart/recipe_controller.dart';
import 'package:cooking_recipe_app/views/widgets/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Recipescreen extends StatelessWidget {

  const Recipescreen({super.key});
   
  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeController>(builder: (_, mod, __) {
     return  Scaffold   (
      body:ListView.builder (
        itemCount: mod.recipesList.length,
        itemBuilder: (context,index) {
          return  RecipeCard(recipe: mod.recipesList[index],
          onFavouriteTap: (){
            mod.setFavourite(recipe: mod.recipesList[index]);
          },) ;
        }
      ),
    );
  });

  
}
}