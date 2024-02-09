import 'package:cooking_recipe_app/views/widgets/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model.dart/recipe_controller.dart';

class SearchScreen extends StatelessWidget {
  
  const SearchScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeController>(builder: (_, mod, __) {
      return Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 45,
              width: 360,
              child: TextField(
                style: const TextStyle(
                  color: Color(0xff020202),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
                onChanged: (value) {
                  mod.searchRecipe(value);
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xfff1f1f1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search for Items",
                  hintStyle: const TextStyle(
                      color: Color(0xffb2b2b2),
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                      decorationThickness: 6),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(itemBuilder: (context ,index){
                return RecipeCard(recipe: mod.results[index]);
              }
              ,itemCount: mod.results.length,),
            )
          ],
        ),
      );
    });
  }
}
