import 'package:cooking_recipe_app/model/recipe_model.dart';
import 'package:flutter/material.dart';

import '../model/user_error.dart';
import '../repo/api_services.dart';
import '../repo/api_status.dart';

class RecipeController extends ChangeNotifier {
  bool _loading = true;
  List<Recipe> _recipesList = [];
  UserError _userError = UserError(code: 0, message: "No Error");

  bool get loading => _loading;
  List<Recipe> get recipesList => _recipesList;
  UserError get userError => _userError;
  List<Recipe> results = [];

  RecipeController() {
    getRecipe();
  }
  void searchRecipe(String value) {
    results.clear();
    for (var element in recipesList) {
      if (element.name.toLowerCase().contains(value.toLowerCase())) {
        results.add(element);
        print(results.length);
        notifyListeners();
      }
    }
  }

  setLoading(bool loadingStatus) async {
    _loading = loadingStatus;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  getRecipe() async {
    setLoading(true);

    var res = await UserSevices.getUsersApi();

    if (res is Success) {
      setRecipeModel(data: res.response as RecipeModel);
    }
    if (res is Failure) {
      UserError userError =
          UserError(code: res.code, message: res.errorresponse.toString());
      setUserError(userError);
    }
    setLoading(false);
  }

  setRecipeModel({required RecipeModel data}) async {
    _recipesList = data.recipes;

    notifyListeners();
  }
}
