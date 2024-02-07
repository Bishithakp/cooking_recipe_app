import 'package:cooking_recipe_app/utils/colors.dart';
import 'package:cooking_recipe_app/views/screens/recipe_screen.dart';
import 'package:flutter/material.dart';

final ValueNotifier<int> indexValueNotifier = ValueNotifier<int>(0);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> homePages = [
      Recipescreen(),
      Text('fav'),
      Text('search')
    ];
    return ValueListenableBuilder<int>(
        valueListenable: indexValueNotifier,
        builder: (_, selectedIndex, __) => Scaffold(
              appBar: AppBar(
                backgroundColor: appColor,
                title: const Text(
                  'Cooking Recipes',
                  style: TextStyle(fontSize: 18, color: themeColor),
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: themeColor,
                      ))
                ],
              ),
              body: homePages.elementAt(selectedIndex),
              bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(label: "", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                    label: '',
                    icon: Icon(Icons.favorite),
                  ),
                  BottomNavigationBarItem(
                      label: '',
                      icon: Icon(
                        Icons.search,
                      )),
                ],
                type: BottomNavigationBarType.shifting,
                selectedItemColor: themeColor,
                unselectedItemColor: Colors.grey,
                iconSize: 30,
                currentIndex: selectedIndex,
                onTap: (value) {
                  indexValueNotifier.value = value;
                },
              ),
            ));
  }
}
