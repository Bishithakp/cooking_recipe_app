import 'package:cooking_recipe_app/model/recipe_model.dart';
import 'package:cooking_recipe_app/utils/colors.dart';
import 'package:cooking_recipe_app/view_model.dart/recipe_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';
import '../screens/recipe_deatil_screen.dart';

class RecipeCard extends StatelessWidget {
  final  Recipe recipe;
   const  RecipeCard({super.key,required this.recipe});

  @override
  Widget build(BuildContext context) {
  
      return InkWell(onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipeDetailScreen(recipese: recipe,)));
      },
        child: Container(margin: const EdgeInsets.symmetric(horizontal:10,vertical: 10 ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromRGBO(158, 158, 158, 1).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill, image: NetworkImage(recipe.image))),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                         Text(
                          recipe.cuisine,
                          style: const TextStyle(fontSize: 18, color: themeColor),
                        ),
                       SizedBox(width: MediaQuery.of(context).size.width/2,
                         child: Text(
                                           recipe.name,
                            style: const TextStyle(
                                fontSize: 21,
                                color: themeColor,
                                fontWeight: FontWeight.bold),
                          ),
                       ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            recipeCardOptions(label: recipe.difficulty),
                            recipeCardOptions(label: recipe.cookTimeMinutes.toString()),
                            recipeCardOptions(label: recipe.rating.toString())
                          ],
                        )
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: themeColor,
                    )
                  ],
                ),
              ),
      );
   } 
  }
  Container recipeCardOptions({required String label}) {
    return Container(
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 226, 223, 223),
      ),
      child: Text(
        label,
        style: const TextStyle(color: themeColor),
      ),
    );
  }
