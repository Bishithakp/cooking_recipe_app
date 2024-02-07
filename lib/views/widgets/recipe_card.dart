import 'package:cooking_recipe_app/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.symmetric(horizontal:10,vertical: 10 ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color.fromRGBO(158, 158, 158, 1).withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill, image: NetworkImage(dummyImage))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'VEGEN',
                      style: TextStyle(fontSize: 18, color: themeColor),
                    ),
                    const Text(
                      'VEGETERIAN BIRIYANI',
                      style: TextStyle(
                          fontSize: 21,
                          color: themeColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        recipeCardOptions(label: "Easy"),
                        recipeCardOptions(label: '15min'),
                        recipeCardOptions(label: '4.8')
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
          );
  }
  Container recipeCardOptions({required String label}) {
    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 226, 223, 223),
      ),
      child: Text(
        label,
        style: TextStyle(color: themeColor),
      ),
    );
  }
}