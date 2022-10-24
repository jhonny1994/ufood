import 'package:sembast/sembast.dart';
import 'package:ufood/core/infurastructure/sembast_database.dart';
import 'package:ufood/recipes/domain/recipe.dart';
import 'package:ufood/recipes/infurastructure/recipe_local_service.dart';

class FavoritesRepository {
  final SembastDatabase _sembastDatabase;
  final RecipeLocalService _recipeLocalService;

  final _store = intMapStoreFactory.store('FavoriteRecipes');

  FavoritesRepository(this._sembastDatabase, this._recipeLocalService);

  Future<List<Recipe>> getFavoriteRecipes() async {
    final recipes = await _store.find(_sembastDatabase.instance);
    return recipes.map((e) => Recipe.fromJson(e.value)).toList();
  }

  Future<void> deleteFavorites() async =>
      _store.delete(_sembastDatabase.instance);

  Future<void> toggleFavoriteState(Recipe recipe) async {
    final tempRecipe = recipe.toJson();
    tempRecipe['isLiked'] = !tempRecipe['isLiked'];
    await _recipeLocalService.toggleFavoriteState(Recipe.fromJson(tempRecipe));
    final result = await _store.findFirst(
      _sembastDatabase.instance,
      finder: Finder(
        filter: Filter.custom(
          (record) {
            return record.value['id'].toString() == recipe.id.toString();
          },
        ),
      ),
    );
    if (result == null) {
      await _store.add(_sembastDatabase.instance, tempRecipe);
    } else {
      await _store.delete(
        _sembastDatabase.instance,
        finder: Finder(
          filter: Filter.custom(
            (record) {
              return record.value['id'].toString() == recipe.id.toString();
            },
          ),
        ),
      );
    }
  }
}
