import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ufood/favorites/infurastructre/favorites_repository.dart';
import 'package:ufood/recipes/domain/recipe.dart';

part 'favorites_state_notifier.freezed.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.loadInProgress() = _LoadInProgress;

  const factory FavoritesState.loadSuccess(List<Recipe> recipes) = _LoadSuccess;

  const FavoritesState._();
}

class FavoritesStateNotifier extends StateNotifier<FavoritesState> {
  final FavoritesRepository _favoritesRepository;

  FavoritesStateNotifier(this._favoritesRepository)
      : super(const FavoritesState.loadInProgress());

  Future<void> getFavoriteRecipes() async {
    final favoriteRecipes = await _favoritesRepository.getFavoriteRecipes();
    state = FavoritesState.loadSuccess(favoriteRecipes);
  }
}
