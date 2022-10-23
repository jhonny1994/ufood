import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ufood/core/domain/fresh.dart';
import 'package:ufood/recipes/domain/app_failure.dart';
import 'package:ufood/recipes/domain/recipe.dart';
import 'package:ufood/recipes/infurastructure/recipe_repository.dart';

part 'recipe_list_state_notifier.freezed.dart';

@freezed
class RecipeListState with _$RecipeListState {
  const factory RecipeListState.loadFailure(AppFailure failure) = _LoadFailure;

  const factory RecipeListState.loadInProgress() = _LoadInProgress;

  const factory RecipeListState.loadSuccess(Fresh<List<Recipe>> recipes) =
      _LoadSuccess;

  const RecipeListState._();
}

class RecipeListStateNotifier extends StateNotifier<RecipeListState> {
  final RecipesRepository _recipeRepository;
  RecipeListStateNotifier(this._recipeRepository)
      : super(const RecipeListState.loadInProgress());

  Future<void> getRecipes() async {
    final recipesOrFailure = await _recipeRepository.getRceipes();
    state = recipesOrFailure.fold(
      (l) => RecipeListState.loadFailure(l),
      (r) => RecipeListState.loadSuccess(r),
    );
  }
}
