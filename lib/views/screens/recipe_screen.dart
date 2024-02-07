import 'package:cooking_recipe_app/utils/colors.dart';
import 'package:cooking_recipe_app/utils/constants.dart';
import 'package:flutter/material.dart';

class Recipescreen extends StatelessWidget {
  const Recipescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView.builder (
        itemCount: 10,
        itemBuilder: (context,index) {
          return const Recipescreen() ;
        }
      ),
    );
  }

  
}
