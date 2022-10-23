import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ufood/core/domain/fresh.dart';
import 'package:ufood/core/infurastructure/network_exceptions.dart';
import 'package:ufood/recipes/domain/app_failure.dart';
import 'package:ufood/recipes/domain/recipe.dart';
import 'package:ufood/recipes/infurastructure/recipe_local_service.dart';
import 'package:ufood/recipes/infurastructure/recipe_remote_service.dart';

class RecipesRepository {
  final RecipeLocalService _recipeLocalService;
  final RecipeRemoteService _recipeRemoteService;

  RecipesRepository(this._recipeLocalService, this._recipeRemoteService);
  Future<Either<AppFailure, Fresh<List<Recipe>>>> getRceipes() async {
    try {
      final remoteRecipes = await _recipeRemoteService.getRemoteRecipes();
      return right(
        await remoteRecipes.when(
          noConnection: (_) async =>
              Fresh.no(await _recipeLocalService.getLocalRecipes()),
          hasData: (data) async {
            final prefs = await SharedPreferences.getInstance();
            final todaysDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
            await prefs.setString('date', todaysDate);
            await _recipeLocalService.upsertRecipes(data);
            return Fresh.yes(data);
          },
          notModified: () async =>
              Fresh.yes(await _recipeLocalService.getLocalRecipes()),
        ),
      );
    } on KoException catch (e) {
      return left(AppFailure.api(e.statusCode));
    }
  }

  Future<Recipe> getRemoteRecipeDetails(int id) async {
    return _recipeRemoteService.getRecipeDetails(id);
  }
}
