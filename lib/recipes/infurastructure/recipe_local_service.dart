import 'package:collection/collection.dart';
import 'package:sembast/sembast.dart';
import 'package:ufood/core/infurastructure/sembast_database.dart';
import 'package:ufood/recipes/domain/recipe.dart';

class RecipeLocalService {
  final SembastDatabase _sembastDatabase;

  final _store = intMapStoreFactory.store('Recipes');
  RecipeLocalService(this._sembastDatabase);

  Future<List<Recipe>> getLocalRecipes() async {
    final recipes = await _store.find(_sembastDatabase.instance);
    return recipes.map((e) => Recipe.fromJson(e.value)).toList();
  }

  Future<Recipe> getLocalRecipeInformation(int id) async {
    final recipe = await _store.findFirst(
      _sembastDatabase.instance,
      finder: Finder(
        filter: Filter.custom(
          (record) {
            return record.value['id'].toString() == id.toString();
          },
        ),
      ),
    );
    return Recipe.fromJson(recipe!.value);
  }

  Future<void> upsertRecipes(List<Recipe> recipes) async {
    await _store
        .records(
          recipes.mapIndexed(
            (index, _) => index,
          ),
        )
        .put(
          _sembastDatabase.instance,
          recipes.map((e) => e.toJson()).toList(),
        );
  }

  void deleteAllRecipes() => _store.delete(_sembastDatabase.instance);

  Future<void> deleteRecipe(int id) async {
    await _store.delete(
      _sembastDatabase.instance,
      finder: Finder(
        filter: Filter.custom(
          (record) {
            return record.value['id'].toString() == id.toString();
          },
        ),
      ),
    );
  }

  Future<void> toggleFavoriteState(Recipe recipe) async {
    await _store.update(
      _sembastDatabase.instance,
      recipe.toJson(),
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
