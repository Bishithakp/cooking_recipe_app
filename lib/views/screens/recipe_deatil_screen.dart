import 'package:cooking_recipe_app/model/recipe_model.dart';
import 'package:cooking_recipe_app/utils/colors.dart';
import 'package:cooking_recipe_app/views/screens/full_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../view_model.dart/recipe_controller.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipese;
  const RecipeDetailScreen({super.key, required this.recipese});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FullImageScreen(
                                  fullimage: recipese.image,
                                )));
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(recipese.image))),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    RatingBar.builder(
                      initialRating: recipese.rating,
                      itemSize: 20,
                      tapOnlyMode: true,
                      minRating: 1,
                      direction: Axis.horizontal,
                 ignoreGestures: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
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
            TabBar(
              labelColor: const Color.fromRGBO(255, 255, 255, 1),
              unselectedLabelColor: Colors.black,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: Colors.pink,
              ),
              tabs: const [
                Tab(
                  text: 'Ingredients',
                ),
                Tab(
                  text: 'Direction',
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const ScrollPhysics(),
                children: [
                  Center(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: recipese.ingredients.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(recipese.ingredients[index]);
                        }),
                  ),
                  Center(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: recipese.instructions.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(recipese.instructions[index]);
                        }),
                  ),
                ],
              ),
            ),
          ]),
        ),
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
