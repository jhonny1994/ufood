import 'package:ufood/core/application/recipe_service.dart';
import 'package:ufood/core/infurastructure/remote_response.dart';
import 'package:ufood/recipes/domain/recipe.dart';
import 'package:ufood/api_key.dart';

class RecipeRemoteService extends RecipeService {
  RecipeRemoteService(super.dio);

  Future<RemoteResponse<List<Recipe>>> getRemoteRecipes() async {
    return super.getRecipes(
      apiKey: spoonacularApiKey,
      url: spoonacularApiUrl,
    );
  }

  Future<Recipe> getRecipeDetails(int id) async {
    return super.getRemoteRecipeDetails(
      apiKey: spoonacularApiKey,
      url: spoonacularApiUrl,
      id: id,
    );
  }
}
