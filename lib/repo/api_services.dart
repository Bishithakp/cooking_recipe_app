import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:cooking_recipe_app/utils/constants.dart';


import '../model/recipe_model.dart';
import 'api_status.dart';

class UserSevices {
  static Future<Object> getUsersApi() async {
    try {
      var url = Uri.parse(recipeApi);
      var resp = await http.get(url);

      if (200 == resp.statusCode) {
        RecipeModel recipeModel = recipeModelFromJson(resp.body);
        return Success(response: recipeModel, code: 200);
      } else {
        return Failure(
            code: USER_INVALID_RESPONSE, errorresponse: 'invalid Response');
      }
    } on HttpException {
      return Failure(code: NO_INTERNET, errorresponse: 'NO internet');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorresponse: 'Invalid Format');
    } catch (err) {
      return Failure(code: UNKNOWN_ERROR, errorresponse: err.toString());
    }
  }
}