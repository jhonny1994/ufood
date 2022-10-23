import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ufood/recipes/domain/app_failure.dart';
import 'package:ufood/recipes/domain/recipe.dart';
import 'package:ufood/recipes/infurastructure/recipe_repository.dart';

part 'recipe_state_notifier.freezed.dart';

@freezed
class RecipeState with _$RecipeState {
  const factory RecipeState.loadFailure(AppFailure failure) = _LoadFailure;

  const factory RecipeState.loadInProgress() = _LoadInProgress;

  const factory RecipeState.loadSuccess(Recipe recipes) = _LoadSuccess;
}

class RecipeStateNotifier extends StateNotifier<RecipeState> {
  final RecipesRepository _recipeRepository;

  RecipeStateNotifier(this._recipeRepository)
      : super(
          const RecipeState.loadInProgress(),
        );
  Future<Recipe> getRecipeDetails(int id) async {
    return _recipeRepository.getRemoteRecipeDetails(id);
  }
}
